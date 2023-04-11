#include Files
include("Include.jl")

#load Data
loading = loaddataset(joinpath(_PATH_TO_DATA, "PS5-dataset-w-repeats.csv"))

#call functions
Matrix = build_data_matrix(loading)
Vector = build_output_vector(loading)

# compute parameters -
XINV = inv(transpose(X)*X)*transpose(X)
β̂ = XINV*y;

# Step 2: estimate the error model.
errors = y - X*β̂; 
ϵ = errormodel(errors);