"""
    _build_nodes_level_dictionary(levels::Int64) -> Dict{Int64,Array{Int64,1}}
"""
function _build_nodes_level_dictionary(levels::Int64)::Dict{Int64,Array{Int64,1}}

    # initialize -
    index_dict = Dict{Int64, Array{Int64,1}}()

    counter = 0
    for l = 0:levels
        
        # create index set for this level -
        index_array = Array{Int64,1}()
        for _ = 1:(l+1)
            counter = counter + 1
            push!(index_array, counter)
        end

        index_dict[l] = (index_array .- 1) # zero based
    end

    # return -
    return index_dict
end


"""
    build(modeltype::Type{MyCRRBinomialLatticeModel}, data::NamedTuple) -> MyCRRBinomialLatticeModel
"""
function build(modeltype::Type{MyAdjacencyBasedCRREquityPriceTree}; utility::Function = _identity,
    h::Int = 1, μ::Float64 = 0.01, σ::Float64 = 0.1, T::Float64 = (1.0/365.0), Sₒ::Float64 = 1.0)::MyAdjacencyBasedCRREquityPriceTree
     
    # initialize -
    model = MyAdjacencyBasedCRREquityPriceTree(); # this model is empty
    nodes_dictionary = Dict{Int, MyCRRLatticeNodeModel}()

    # compute u, d and p
    ΔT = T / h
    u = exp(σ * sqrt(ΔT))
    d = 1.0/u;
    p = (exp(µ * ΔT) - d) / (u - d)
  
    # compute connectivity - 
    number_items_per_level = [i for i = 1:(h+1)]
    tmp_array = Array{Int64,1}()
    theta = 0
    for value in number_items_per_level
        for _ = 1:value
            push!(tmp_array, theta)
        end
        theta = theta + 1
    end

    N = sum(number_items_per_level[1:(h)])
    connectivity_index_array = Array{Int64,2}(undef, N, 3)
    for row_index = 1:N

        # index_array[row_index,1] = tmp_array[row_index]
        connectivity_index_array[row_index, 1] = row_index
        connectivity_index_array[row_index, 2] = row_index + 1 + tmp_array[row_index]
        connectivity_index_array[row_index, 3] = row_index + 2 + tmp_array[row_index]
    end
    
    # adjust for zero base -
    zero_based_array = connectivity_index_array .- 1;

    # build connectivity dictionary -
    N = sum(number_items_per_level[1:end-1])
    connectivity = Dict{Int64, Array{Int64,1}}()
    for i ∈ 0:(N-1)
        # grab the connectivity -
        connectivity[i] = reverse(zero_based_array[i+1,2:end])
    end

    # compute the price and probability, and store in the nodes dictionary
    counter = 0;
    for t ∈ 0:h

        # prices -
        for k ∈ 0:t
            
            t′ = big(t)
            k′ = big(k)

            # compute the prices and P for this level
            price = utility(Sₒ*(u^(t-k))*(d^(k)));
            P = binomial(t′,k′)*(p^(t-k))*(1-p)^(k);

            # create a node model -
            node = MyCRRLatticeNodeModel();
            node.price = price
            node.probability = P;
            node.intrinsic = 0.0; # intrinsic value gets updated later, for now -> 0.0
            node.extrinsic = 0.0; # extrinsic value gets updated later, for now -> 0.0
            
            # push this into the array -
            nodes_dictionary[counter] = node;
            counter += 1
        end
    end

    # put it back in order -
    for i ∈ 0:(N-1)
        # grab the connectivity -
        connectivity[i] = zero_based_array[i+1,2:end]
    end

    # # set the data, and connectivity for the model -
    model.data = nodes_dictionary;
    model.connectivity = connectivity;
    model.levels = _build_nodes_level_dictionary(h)
    model.p = p;
    model.u = u;
    model.ΔT = ΔT
    model.μ = μ

    # return -
    return model
end


"""
    build(contractType::Type{T}, options::NamedTuple) -> AbstractAssetModel where {T<:AbstractAssetModel}
"""
function build(contractType::Type{T}, data::NamedTuple)::AbstractAssetModel where {T<:AbstractAssetModel}

    # initialize -
    model = eval(Meta.parse("$(contractType)()")) # empty contract model -

    # if we have options, add them to the contract model -
    if (isempty(data) == false)
    
        for key ∈ fieldnames(contractType)
            
            # convert the field_name_symbol to a string -
            field_name_string = string(key)

            # check the for the key -
            if (haskey(data, key) == false)
                throw(ArgumentError("NamedTuple is missing: $(field_name_string)"))
            end

            # get the value -
            value = data[key]

            # set -
            setproperty!(model, key, value)
        end
    end

    # return -
    return model
end