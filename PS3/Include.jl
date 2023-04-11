# setup paths -
const _ROOT = pwd()
const _PATH_TO_SRC = joinpath(_ROOT, "src")

# load external packages -
using LinearAlgebra
using IterativeSolvers

# load my codes -
# TODO: Fill in the include statements with your files
include(joinpath(_PATH_TO_SRC, "Types.jl"))
include(joinpath(_PATH_TO_SRC, "Solvers.jl"))
include(joinpath(_PATH_TO_SRC, "Factory.jl"))