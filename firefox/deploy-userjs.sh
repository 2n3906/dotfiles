#!/bin/sh

case "$OSTYPE" in
  darwin*)  FF_PROFILE_BASE="~/Library/Application\ Support/Firefox/Profiles" ;; 
  linux*)   FF_PROFILE_BASE="~/.mozilla/firefox" ;;
  *)        echo "unknown: $OSTYPE" ;;
esac

PROFILEDIR=$(ls -d -1 ${FF_PROFILE_BASE}/*)
