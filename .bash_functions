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
  ruby -r cgi -e 'puts CGI.escape ARGV[0]' "$1"
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

# scp via gateway
# $1: gateway, $2: remote host, $3, $4: locations
scpvg() {
  scp -Cp -o "ProxyCommand ssh -A $1 nc $2 22" $3 $4
}

# Remove all global npm modules
flushnpm() {
  npm -g ls | grep -v 'npm@' | awk '/@/ {print $2}' | awk -F@ '{print $1}' | xargs npm -g rm
}

# serve current directory
servedir() {
  sleep 1 && chrome-cli open "localhost:9090" -n &
  ruby -run -e httpd . -p 9090
}

# output TLS cert info
certinfo() {
  openssl x509 -in $1 -noout -text
}

# reset wifi networks and prefs.
reset-wifi-prefs() {
  cfgdir=/Library/Preferences/SystemConfiguration
  bkdir=~/Desktop/sys-config-bu
  mkdir -p $bkdir
  for f in NetworkInterfaces.plist com.apple.airport.preferences.plist preferences.plist; do
    sudo mv $cfgdir/$f $bkdir
  done
  cat <<EOF
Network preference files moved to $bkdir. You can delete them.
Restart to complete the reset.
EOF
}
