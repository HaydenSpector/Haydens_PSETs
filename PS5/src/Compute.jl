"""
    build_data_matrix(data::DataFrame) --> Array{Float64,2}
TODO: Fill me in.
"""
function build_data_matrix(data::DataFrame)::Array{Float64,2}
    n = 100
    m = 4
    dm = zeros(n, m)

    # Fill in the dynamic programming matrix
    for i in 1:n  # this should avoid any errors
        for j in 2:m
            dm[i,j] = data[i,j] # 1-indexed
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
    μ = mean(residuals); # default value, replace with your value
    σ = std(residuals); # default value, replace with your value

    # return -
    return Normal(μ, σ);
end