# cd into matching gem directory
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
_cdgem() {
  COMPREPLY=($(compgen -W '$(ls `gem env gemdir`/gems)' -- ${COMP_WORDS[COMP_CWORD]}))
  return 0;
}
complete -o default -o nospace -F _cdgem cdgem;

# Encode the string into "%xx"
urlencode() {
  ruby -e 'puts ARGV[0].split(/%/).map{|c|"%c"%c.to_i(16)} * ""' "$1"
}

# Decode a urlencoded string ("%xx")
urldecode() {
  ruby -r cgi -e 'puts CGI.unescape ARGV[0]' "$1"
}

# Decode a urlencoded string ("%xx")
urldecode() {
  ruby -r cgi -e 'puts CGI.unescape ARGV[0]' "$1"
}

# Use MacVim's terminal vim (requires MacVim installed via homebrew)
MACVIM_PATH=$(brew info macvim | sed -n '/installed to:/ {n;s/ *\(.*\)/\1/p;q;}')/MacVim.app/Contents/MacOS/Vim
vim() {
  if [[ $1 = *#* ]]; then
    local controller=${1%#*} action=${1##*#}; shift

    local re=\(.*\)\([A-Z]\)\(.*\)
    while [[ $controller =~ $re ]]; do
      controller=${BASH_REMATCH[1]:+${BASH_REMATCH[1]}_}${BASH_REMATCH[2],,}${BASH_REMATCH[3]}
    done

    set -- +/"^\\s*def \\zs\\<$action\\>" +"normal zz" "app/controllers/${controller}.rb" "$@"
  elif [[ $1 = *?:?* && ${1##*:} != *[!0-9]* ]]; then
    local filename=${1%:*} linenum=${1##*:}; shift

    set -- +"$linenum" +"normal zz" "$filename" "$@"
  fi

  if [[ -x $MACVIM_PATH ]]; then
    "$MACVIM_PATH" "$@"
  else
    command vim "$@"
  fi
}

# open mvim for ack search results
ackvim() {
  local pattern=$1; shift
  ack -l --print0 "$pattern" "$@" | xargs -0o mvim -o +/"$pattern"
}

# reverse find
# rfind() {
#   local target="$1" cwd="$PWD"
#
#   [[ "$target" ]] || { echo "ERROR: missing target" >&2; return 1; }
#
#   while [[ "$cwd" ]]; do
#     if [[ -e "$cwd"/"$target" ]]; then
#       echo "$cwd"/"$target"
#       return 0
#     fi
#     cwd="${cwd%/*}"
#   done
#   return 1
# }; export -f rfind
