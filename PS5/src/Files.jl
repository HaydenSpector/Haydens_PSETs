"""
    loaddataset(path::String) -> DataFrame

Loads the price dataset, returns the data as a DataFrame type.
See: https://dataframes.juliadata.org/stable/man/getting_started/
"""
function loaddataset(path::String)::DataFrame

    # load the data, and returns this data as a DataFrame
    return CSV.read(path,DataFrame);
end