# Crop

this is a script that I use to convert 2 page manga pages into 1 page.

## dependencies
- imagemagick
- bc(basic calculator) program

## how it works

```sh
./crop [dir]
```

the script `cd`s into the specified dir, looks for `jpg` files, checks its `aspect ratio` (width / height), if is it > 0.8 (normal manga aspect ratio is roughly 3:4 --> ~0.75), crops the image into half, and flips it. then it loops all `jpg` files again then flips it to reorder the files. 

