#!/usr/bin/env bash

# builds a windows executable and packages it with the runtime dependencies
# expects dist/levelup.love to exist

if [[ ! -f dist/levelup.love ]]; then
  echo dist/levelup.love missing
  exit 1
fi

download='love-0.9.0-win64'

if [[ ! -d /tmp/$download.zip ]]; then
  curl -L "https://bitbucket.org/rude/love/downloads/$download.zip" > /tmp/$download.zip
  unzip -o /tmp/$download.zip -d /tmp
fi

cat dist/levelup.love /tmp/$download/love.exe > /tmp/$download/levelup.exe
pushd /tmp/$download && zip levelup.zip * -x love.exe && popd
mv /tmp/$download/levelup.zip dist/windows-levelup.zip
