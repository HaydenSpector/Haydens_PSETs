"""
    encrypt(plaintext::String) -> Dict{Int64,String}

"""

function encrypt(plaintext::String)::Dict{Int64,String}
 # initialize -
 message = Dict{Int64,String}()
 counter = 0;

 # build encryptionkey -
 encryption_model = _build(DNAEncryptionKey);
 encryptionkey = encryption_model.encryptionkey;

 for c ∈ uppercase(plaintext)

     # encrypt -
     message[counter] = encryptionkey[c]

     # update the counter -
     counter = counter + 1
 end

 # return -
 return message
end


"""
    decrypt(encrypteddata::Dict{Int64,String}) -> String

Fill me in
"""
function decrypt(encrypteddata::Dict{Int64,String})::String
end