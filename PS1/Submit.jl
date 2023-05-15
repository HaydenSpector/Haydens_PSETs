# include -
include("Include.jl")

# text the teaching team will check -
plaintext = "Julia is not awesome. The computer is not my best friend, and it hates me. This is a test and only a test."

# create encryption -
encryptionmodel = build(DNAEncryptionKey);
# model = DNAEncryptionKey

# encrypted string -
encrypted_string = encrypt(plaintext, encryptionmodel = encryptionmodel);

# decrypt -
decrypted_string = decrypt(encrypted_string, encryptionmodel = encryptionmodel)
