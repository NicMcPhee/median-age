#!/usr/bin/env bash

path=$1
dir=$(dirname "$path")
file=$(basename "$path")

(
    cd "$dir" || exit
    timestamp=$(
        git blame --line-porcelain "$file" |
            # We want to get the author-time lines out of `git blame --porcelain`.
            grep author-time |
            # Take the median of the 2nd column (the time stamps)
            datamash --field-separator ' ' median 2
        )
    # I'm not sure we *always* want to convert to a human readable form?
    # There might be times when the time stamp would be more useful?
    date -d "@$timestamp"
)
