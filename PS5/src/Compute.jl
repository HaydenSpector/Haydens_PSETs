"""
    build_data_matrix(data::DataFrame) --> Array{Float64,2}
TODO: Fill me in.
"""
function build_data_matrix(data::DataFrame)::Array{Float64,2}
   #initialize

   number_of_repeats = 3;
   
    (n,m) = size(data);

    # Fill in the dynamic programming matrix
    S_array = Array{Float64,1}();

    for i in 1:n  # this should avoid any errors
        S_value - data[i,:S]
        for j in 1:number_of_repeats
            push!(S_array,(1/S_value))
        end
    end

   # construct the data matrix -
   X = Array{Float64,2}(undef, number_of_repeats*R, 2);
   for i ∈ 1:number_of_repeats:(number_of_repeats*R)
       for j ∈ i:(i+number_of_repeats-1)
           
           # get the S level -
           S_value = S_array[j];
           
           # fill in the columns of the data matrix -
           X[j,1] = 1.0;
           X[j,2] = S_value
       end
   end

   # return -
   return X
end

"""
    build_output_vector(data::DataFrame) --> Array{Float64,1}
TODO: Fill me in.
"""
function build_output_vector(data::DataFrame)::Array{Float64,1}
    number_of_repeats = 3
    (n,m) = size(data);
    Y_array = Array{Floar64,1}();
    for i in 1:n
        for j in number_of_repeats
            Y_value = [i,1+j];
        end
    end

    return Y_array;
end

"""
    build_error_distribution(residuals::Array{Float64,1}) -> Normal
Fill me in.
"""
function build_error_distribution(residuals::Array{Float64,1})::Normal

    #initialize-
    μ = 0.0;
    σ = 0.0;
    # compute
    μ = mean(residuals); # default value, replace with your value
    σ = std(residuals); # default value, replace with your value

    # return -
    return Normal(μ, σ);
end