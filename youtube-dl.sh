#!/bin/bash

if [ -z "$1" ]
    then echo "Requires the URL of the youtube video as an argument"
  exit
fi

youtube-dl --extract-audio --audio-format mp3 --prefer-ffmpeg -o '$HOME/Downloads/%(title)s-%(id)s.%(ext)s' $1
