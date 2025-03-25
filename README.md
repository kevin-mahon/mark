This repository is a personal project to create a mark tool similar to 
nvim marks but for the file system.

## Features
- [X] Add mark 
- [X] Remove mark 
- [X] Jump to marks 
- [X] Jump back 
- [X] List marks

## Installation
<!-- For Usage: -->
<!-- 1. Run `wget https:// ` -->

For Development:
1. Clone the repository
    `git clone git@github.com:kevin-mahon/mark.git`
2. Make sure the shell script is executable
    `chmod +x mark.sh`
5. (Optional) Alias the script to a command in your shell i.e.
    `alias m="<path to repo>/mark.sh"`
    `alias j="<path to repo>/mark.sh -j"`
    `alias b="<path to repo>/mark.sh -b"`
## Usage
- `m <mark name>` - Add a new mark 
- `m -r <mark name>` - Remove a mark 
- `m -j <mark name>` - Jump to a mark
- `m -b` - Jump back
- `m -l` - List all notes


