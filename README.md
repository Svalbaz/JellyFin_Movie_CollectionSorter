# JellyFin_Movie_CollectionSorter

# SvalbazNet: Movie_CollectionSorter.ps1

## Target
Movies

## Description
This script scans all folders in `$rootMovies` for folders that don't contain a year in parentheses and checks if they contain multiple subfolders. If the folder seems to represent a "Collection" (e.g., a franchise), it renames the folder accordingly.

## Purpose
After struggling with a poor initial setup in JellyFin, this script was developed to help sort movie collections. It determines whether a folder is likely a collection and renames it with the appropriate structure to help manage the movies better.

## Safe Mode
This script runs in "SAFE MODE" by default. It will only display what it intends to rename (`Write-Host`) without actually renaming anything. To apply the changes, remove the `-WhatIf` parameter.

## Usage
Run the script in your movie library folder to check for collection folders. The script will show what it plans to rename, and only after disabling the `-WhatIf` flag will it apply the changes.
