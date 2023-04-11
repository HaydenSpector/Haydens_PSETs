"""
    build_data_matrix(data::DataFrame) --> Array{Float64,2}
"""
function build_data_matrix(data::DataFrame)::Array{Float64,2}
    n = 100
    m = 4
    dm = zeros(n,m)

    # Fill in the dynamic programing build_data_matrix
    for i in 1:(n) # avoid errors 
        for j in 2:(m)
            dm[i,j] = data[i,j] # one indexed
        end
    end
    return dm
end

"""
    build_output_vector(data::DataFrame) --> Array{Float64,1}

TODO: Fill me in.
"""
function build_output_vector(data::DataFrame)::Array{Float64,1}
    n = 100
    ov = zeros(n)
    for i in 1:n
        ov[i, 1] = data[i, 1]
    end

    return ov
end

"""
    build_error_distribution(residuals::Array{Float64,1}) -> Normal

Fill me in.
"""
function build_error_distribution(residuals::Array{Float64,1})::Normal

    # initialize -
    μ = 1.0;
    σ = 2.0;

    # return -
    return Normal(μ, σ);
end

