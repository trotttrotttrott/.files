#!/usr/bin/env bash

# cd into current ruby's gem directory
cdgem() {
  local gempath=$(gem env gemdir)/gems
  if [[ $1 == "" ]]; then
    cd $gempath
    return
  fi
  local gem=$(ls $gempath | g $1 | sort | tail -1)
  if [[ $gem != "" ]]; then
    cd $gempath/$gem
  fi
}

# install global python packages with pip
syspip(){
  PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

# Encode the string into "%xx"
urlencode() {
  ruby -e 'puts ARGV[0].split(/%/).map{|c|"%c"%c.to_i(16)} * ""' "$1"
}

# Decode a urlencoded string ("%xx")
urldecode() {
  ruby -r cgi -e 'puts CGI.unescape ARGV[0]' "$1"
}

# find and replace regex with ack & perl
agandreplace() {
  ag -l $1 $3 | xargs perl -pi -E "s/$1/$2/g"
}

# show 256 terminal colo(u)rs
colour() {
  for i in {0..255} ; do
    printf "\x1b[38;5;${i}mcolour${i}\n"
  done
}
