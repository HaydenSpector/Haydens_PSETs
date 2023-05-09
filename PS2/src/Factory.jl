
"""
    read_compounds_file(path::String) -> Dict{String, MyChemicalCompoundModel}

TODO: Describe what this function is doing, the args and the what is contained in the data that is returned.
#It looks in the Compounds.data file and reads it. Then, it returns the list of compounds in the file.
"""

function build(type::Type{MyChemicalCompoundModel}, name::String, compound::String)::MyChemicalCompoundModel

    # check: name, reactants and products correct?
    # in production, we'd check this. Assume these are ok now

    # initialize -
    model = MyChemicalCompoundModel(); # build an empty model 

    # add data to the model -
    model.name = name;
    model.compound = compound;

    # return -
    return model;
end