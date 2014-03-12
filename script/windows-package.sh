#!/usr/bin/env bash

# builds a windows executable and packages it with the runtime dependencies
# expects dist/levelup.love to exist

if [[ ! -f dist/levelup.love ]]; then
  echo dist/levelup.love missing
  exit 1
fi

download='love-0.9.0-win64'

# download and unzip the latest love
curl -L "https://bitbucket.org/rude/love/downloads/$download.zip" > /tmp/$download.zip
unzip -o /tmp/$download.zip -d /tmp

# combine the exe with the lua files
cat dist/levelup.love /tmp/$download/love.exe > /tmp/$download/levelup.exe

# zip it and move it to dist
pushd /tmp/$download && zip levelup.zip * -x love.exe && popd
mv /tmp/$download/levelup.zip dist/windows-levelup.zip
