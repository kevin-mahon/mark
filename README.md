This is just a shell script to create a mark tool similar to 
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
2a. (Optional) Alias the script to a command in your shell i.e.
    `alias m="source <path to repo>/src/mark.sh"`
    `alias j="source <path to repo>/src/mark.sh -j"`
    `alias b="source <path to repo>/src/mark.sh -b"`
3. Make sure whenever you invoke the script you source it :
    `source <path to repo>/src/mark.sh` or
    `. ./<path to repo>/src/mark.sh`
## Usage
- `m <mark name>` - Add a new mark 
- `m -r <mark name>` - Remove a mark 
- `m -j <mark name>` - Jump to a mark
- `m -b` - Jump back
- `m -l` - List all notes


