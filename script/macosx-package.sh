#!/usr/bin/env bash

# builds an mac os x app
# expects dist/levelup.love to exist

if [[ ! -f dist/levelup.love ]]; then
  echo dist/levelup.love missing
  exit 1
fi

download='love-0.9.0-macosx-x64'

if [[ -d /tmp/LevelUp.app ]]; then
  rm -r /tmp/LevelUp.app
fi

# get the latest Love and unzip it
echo Downloading $download
curl -s -L "https://bitbucket.org/rude/love/downloads/$download.zip" > /tmp/$download.zip
unzip -q -o /tmp/$download.zip -d /tmp

# create a LevelUp.app by renaming love.app, copying the levelup.love lua, and replacing the Info.plist
echo Building LevelUp.app
mv /tmp/love.app /tmp/LevelUp.app
cp dist/levelup.love /tmp/LevelUp.app/Contents/Resources/
echo '<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>BuildMachineOSBuild</key>
	<string>13B42</string>
	<key>CFBundleDevelopmentRegion</key>
	<string>English</string>
	<key>CFBundleDocumentTypes</key>
	<array>
		<dict>
			<key>CFBundleTypeIconFile</key>
			<string>LoveDocument.icns</string>
			<key>CFBundleTypeName</key>
			<string>LÖVE Project</string>
			<key>CFBundleTypeRole</key>
			<string>Viewer</string>
			<key>LSHandlerRank</key>
			<string>Owner</string>
			<key>LSItemContentTypes</key>
			<array>
				<string>org.love2d.love-game</string>
			</array>
		</dict>
		<dict>
			<key>CFBundleTypeName</key>
			<string>Folder</string>
			<key>CFBundleTypeOSTypes</key>
			<array>
				<string>fold</string>
			</array>
			<key>CFBundleTypeRole</key>
			<string>Viewer</string>
			<key>LSHandlerRank</key>
			<string>None</string>
		</dict>
	</array>
	<key>CFBundleExecutable</key>
	<string>love</string>
	<key>CFBundleIconFile</key>
	<string>Love.icns</string>
	<key>CFBundleIdentifier</key>
	<string>org.thoughtworks.levelup</string>
	<key>CFBundleInfoDictionaryVersion</key>
	<string>6.0</string>
	<key>CFBundleName</key>
	<string>LevelUp</string>
	<key>CFBundlePackageType</key>
	<string>APPL</string>
	<key>CFBundleShortVersionString</key>
	<string>0.9.0</string>
	<key>CFBundleSignature</key>
	<string>LoVe</string>
	<key>DTCompiler</key>
	<string>com.apple.compilers.llvm.clang.1_0</string>
	<key>DTPlatformBuild</key>
	<string>5A3005</string>
	<key>DTPlatformVersion</key>
	<string>GM</string>
	<key>DTSDKBuild</key>
	<string>13A595</string>
	<key>DTSDKName</key>
	<string>macosx10.9</string>
	<key>DTXcode</key>
	<string>0502</string>
	<key>DTXcodeBuild</key>
	<string>5A3005</string>
	<key>LSApplicationCategoryType</key>
	<string>public.app-category.games</string>
	<key>NSHumanReadableCopyright</key>
	<string>© 2014 ThoughtWorks</string>
	<key>NSPrincipalClass</key>
	<string>NSApplication</string>
</dict>
</plist>' > /tmp/LevelUp.app/Contents/Info.plist

# tar it up and move to dist
pushd /tmp > /dev/null && tar -czf LevelUp.app.tar.gz LevelUp.app && popd > /dev/null
mv /tmp/LevelUp.app.tar.gz dist/

echo Complete
