-- :set ft=applescript

tell application "Finder"
  set dimensions to bounds of window of desktop
  set x1 to item 1 of dimensions
  set y1 to item 2 of dimensions
  set x2 to item 3 of dimensions
  set y2 to item 4 of dimensions
end tell

set width to x2 - x1
set height to y2 - y1

set things to {"Terminal", "MacVim"}

repeat with thing in things
  tell application thing
    set thingWindows to every window whose resizable is true
    repeat with i from 1 to (count of thingWindows)
      set thingWindow to item i of thingWindows
      set bounds of thingWindow to {x1, y1, x2, y2}
    end repeat
  end tell
end repeat
