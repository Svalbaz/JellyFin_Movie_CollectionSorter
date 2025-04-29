<#
SvalbazNet: Movie_CollectionSorter.ps1

Target:		Movies
Use: 		Script looks recursively at all folders in $rootMovies for any folder which does not have a year in parenthes, checks if that contains multiple subfolders and determines if it is likely a 'Collection' folder and renames accordingly
Reason: 	After a botched start with JellyFin I had to sort my Movies into a proper folder structure and as such needed to confirm if these folders were likely to be collections, to help me manage it.

# SAFE MODE: This Script is saved in "SAFE MODE", so by default it will only Write-Host the result,
it will not actually Rename-Item until you remove the -WhatIf
#>

# ----- VARIABLES ----- #
# Path to your Movies directory
$rootMovies = 	"\\192.168.1.184\Movies\Movies"

# ----- SCRIPT ----- #
# Get all top-level folders
Get-ChildItem -Path $rootMovies -Directory | ForEach-Object {
    $folderName = $_.Name

    # Skip if folder name includes a year in parentheses, e.g. (1999)
    if ($folderName -notmatch '\(\d{4}\)') {
        # Check if the folder contains multiple subfolders (likely a collection)
        $subDirs = Get-ChildItem -Path $_.FullName -Directory -ErrorAction SilentlyContinue
        if ($subDirs.Count -gt 1) {
            $newName = "$folderName Collection"
            $newPath = Join-Path -Path $_.Parent.FullName -ChildPath $newName

            Write-Host "`nLikely collection: $folderName"
            Write-Host "Renaming to: $newName"

            # Rename the folder
            Rename-Item -Path $_.FullName -NewName $newName -WhatIf # SAFE MODE: REMOVE -WhatIf to Rename-Item
        }
    }
}
