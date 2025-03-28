This is just a shell script to create a mark tool similar to 
nvim marks but for the file system.

## Features
- [X] Add mark 
- [X] Remove mark 
- [X] Jump to marks 
- [X] Jump back 
- [X] List marks

## Installation
Run the script install.sh
```
./install.sh
```
This will add the commands m, j, and b to your shell rc.  
m is basic invokation
j <mark> will jump to the mark
b will jump back to where you came from

## Usage
- `m <mark name>` - Add a new mark 
- `m -r <mark name>` - Remove a mark 
- `m -j <mark name>` - Jump to a mark
- `m -b` - Jump back
- `m -l` - List all notes


