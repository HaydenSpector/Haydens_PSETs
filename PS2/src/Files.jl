
"""
    read_compounds_file(path::String) -> Dict{String, MyChemicalCompoundModel}

TODO: Describe what this function is doing, the args and the what is contained in the data that is returned.
#It looks in the Compounds.data file and reads it. Then, it returns the list of compounds in the file.
"""

function read_compounds_file(path::String)::Dict{String, MyChemicalCompoundModel}
    
 # check: is path legit?
 # in production we would check this path, assume ok for now
    
 # initialize -
 compounds = Dict{String, MyChemicalCompoundModel}()
 counter = 0; # zero-based index
    
 # use example pattern from: https://varnerlab.github.io/CHEME-1800-Computing-Book/unit-1-basics/data-file-io.html#program-read-a-csv-file-refactored
    open(path, "r") do io
        for line in eachline(io) # read each line from the stream

         if (contains(line,"#") == false)
    
         fields = split(line, ','); # splits around the ','
    
         # grab the fields -
         name = string(fields[1]);
         compound = string(fields[2]);
                    
         # build - 
         model = build(MyChemicalCompoundModel, name, compound);
    
         # store -
         compounds[name] = model;
         end
     end
 end
    #return 
    return compounds
end