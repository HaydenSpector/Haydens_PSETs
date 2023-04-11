# TODO: Fill me in with your program to compute the uknown model parameters from the data

include("Include.jl")

loading = loaddataset(joinpath(_PATH_TO_DATA,"PS5-dataset-w-repeats.csv"))

matrix = build_data_matrix(loading)

vector = build_output_vector(loading)

mINV = inv(transpose(matrix)*matrix)*transpose(matrix)
β̂ = mINV*vector

# Step 2: estimate the error model.
errors = vector - matrix*β̂;
ϵ = errormodel(errors)