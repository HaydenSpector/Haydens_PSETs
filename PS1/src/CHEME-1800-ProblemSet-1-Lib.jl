"""
    encrypt(plaintext::String) -> Dict{Int64,String}

Fill me in
"""
abstract type AbstractEncryptionKey end

function encrypt(plaintext::String)::Dict{Int64,String}
mutable struct DNAEncryptionKey <: AbstractEncryptionKey

    # data -
    encryptionkey::Dict{Char, String}

    # constructor 
    DNAEncryptionKey() = new()
end


"""
    decrypt(encrypteddata::Dict{Int64,String}) -> String

Fill me in
"""
function decrypt(encrypteddata::Dict{Int64,String})::String
end