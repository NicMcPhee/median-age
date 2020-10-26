#!/usr/bin/env bash

path=$1
dir=$(dirname "$path")
file=$(basename "$path")

(
    cd "$dir" || exit
    git blame --line-porcelain "$file" | \
        # We want to get the author-time lines out of `git blame --porcelain`. \
        grep author-time | \
        # Take the median of the 2nd column (the time stamps) \
        datamash --field-separator ' ' median 2
)
