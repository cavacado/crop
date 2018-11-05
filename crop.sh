#!/bin/bash
# unused
# size=$(magick identify -format "%w" $f)
# dimen=$(magick identify -format "%wx%h" $f)

# go into supplied dir
cd "$@"
for f in *.jpg
  do
    # calc the aspect ratio of an image === width / height
    aspect=$(magick identify -format "%[fx:w/h]" $f)
    fn=$(basename $f .jpg)
    # https://stackoverflow.com/a/31087503
    if (( $(echo "$aspect > 0.8" |bc -l) ))
    then
      echo processing file...
      # flip and crop, image orientation is now mirrored
      convert -verbose -flop -crop 50%x100% $f ${fn}_%d.jpg
      rm $f
      echo removing original file...
      for g in ${fn}_*.jpg
      do
      echo reordering files...
      # flip again to reorientate image
      convert -verbose -flop $g ${g}
      done
    fi
done
cd ..

