"""
    _build_right_handside_vector(N::Int64, κ::Float64, h::Float64, Cₒ::Float64) -> Array{Float64,1}

Internal function that constructs the right-hand side vector for the chemical decay problem
"""
function _build_right_handside_vector(N::Int64, κ::Float64, h::Float64, Cₒ::Float64)::Array{Float64,1}
    b = zeros(N)
    b[1] = Cₒ - Cₒ*h*k
    return b
end

"""
    _build_system_matrix(N::Int64, κ::Float64, h::Float64) -> Array{Float64,2}

Internal function that constructs the system matrix for the chemical decay problem
"""
 function _build_system_matrix(N::Int64, κ::Float64, h::Float64)::Array{Float64,2}

    # Initialize
    A = Array{Float64,2}(undef,N,N)
    fill!(A,0.0)
    A[1,1] = 1

    # main
     for i in 2:N #horizontal
         for j in 2:N #vertical
             if (i == j)
                 A[i,j]= 1
                 A[i,j-1]=(h*k-1)
          end
        end
    end
     return A
end
""" 
Build an instance of MyChemicaldecayModel and sets the value of the model parameters. 
Default model parameters are zero
"""
function build(type::Type{MyChemicalDecayModel}; 
    κ::Float64 = 0.0, h::Float64 = 0.0, N::Int64 = 0, Cₒ::Float64 = 0.0)::MyChemicalDecayModel

    # build an empty model -
    model = MyChemicalDecayModel()

    # set parameters on the model
    model.κ = κ
    model.h = h
    model.N = N
    model.Cₒ = Cₒ
    model.A = _build_system_matrix(N, κ, h)
    model.b = _build_right_handside_vector(N, κ, h, Cₒ)

    # return
    return model
end



