#! /bin/bash

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

# Encode the string into "%xx"
urlencode() {
  ruby -e 'puts ARGV[0].split(/%/).map{|c|"%c"%c.to_i(16)} * ""' "$1"
}

# Decode a urlencoded string ("%xx")
urldecode() {
  ruby -r cgi -e 'puts CGI.unescape ARGV[0]' "$1"
}

# open mvim for ack search results
ackvim() {
  local pattern=$1; shift
  ack -l --print0 "$pattern" "$@" | xargs -0o mvim -o +/"$pattern"
}

# find and replace regex with ack & perl
ackandreplace() {
  local pattern=$1; shift
  ack -l $pattern | xargs perl -pi -E 's/$pattern/replacement/g'
}

# show 256 terminal colo(u)rs
colour() {
  for i in {0..255} ; do
    printf "\x1b[38;5;${i}mcolour${i}\n"
  done
}

# maximize all Terminal, MacVim, & browswer windows
maximize() {
  osascript -e '
    tell application "Finder"
      set dimensions to bounds of window of desktop
      set x1 to item 1 of dimensions
      set y1 to item 2 of dimensions
      set x2 to item 3 of dimensions
      set y2 to item 4 of dimensions
    end tell

    set things to {"Terminal", "MacVim", "Google Chrome", "Safari"}

    repeat with thing in things
      tell application thing
        set thingWindows to every window whose resizable is true
        repeat with i from 1 to (count of thingWindows)
          set thingWindow to item i of thingWindows
          if thing is in {"Terminal", "MacVim"}
            set bounds of thingWindow to {x1, y1, x2, y2} -- maximize x, y
          else
            set thingDimensions to bounds of thingWindow
            set bounds of thingWindow to {(item 1 of thingDimensions), y1, (item 3 of thingDimensions), y2} -- maximize y
          end if
        end repeat
      end tell
    end repeat'
}
