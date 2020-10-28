#!/usr/bin/env bash

# Compute the "median age" of the specified file based on the git commit
# dates of the lines in the file.

# Requires that you have the program `datamash` installed.

path=$1
dir=$(dirname "$path")
file=$(basename "$path")

(
    cd "$dir" || exit
    timestamp=$(
        git blame --line-porcelain "$file" |
            # We want to get the author-time lines out of `git blame --porcelain`.
            grep author-time |
            # Take the min, max, median, and sampled standard deviation
            # of the 2nd column (the time stamps)
            datamash --field-separator ' ' min 2 max 2 median 2 sstdev 2
        )
    # It would be nice to at least have the option of converting the
    # timestamps into more human readable forms like that provided by
    # `date -d @1389842262`? That should probably be controlled by 
    # flags in some way. We might also want to allow
    # for CSV style output for systems that want to read this and do
    # additional analysis on it.
    echo "$timestamp"
)
