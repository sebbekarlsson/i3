# ViM
## Requirements
* cmake
* flake8

## Moving around
### Buffers
> `alt + <arrow-key>` to move to different buffers.

### Hightlight words

> Run `ctrl + alt + d` to toggle highlight mode  
> When cursor on word, press `*` to highlight it.  
> Press `*` again to go to next and `#` to go to previous

### Other
> `$` to go to the end of a line.

> `E` to skip words forwards.

> `B` to skip words backwards.

## Filetree
> `CTRL + T` will toggle the filetree.

### Opening files
> `enter` will open a file and replace the current buffer.  
> `s` will open a file in a new buffer / split.


## Formating code
### Pretty JSON
> To make JSON pretty, open the file and run: `:Jsonfix`

### Normal formating
> To make things pretty run: `gg=G`

### Sorround words
> Add quotes to a word: `yss"` => "Hello world"  
> Changing type of quotes: `cs"'` => 'Hello world'  
> Deleting quotes: `ds"` => Hello world
