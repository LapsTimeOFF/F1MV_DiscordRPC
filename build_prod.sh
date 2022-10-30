echo 'Starting building...'
echo 'Building Win32x64'
electron-packager ./ F1MV-DiscordRPC --platform=win32 --arch=x64
echo 'Building Win32x64 completed'
echo 'Building Darwin'
electron-packager ./ F1MV-DiscordRPC --platform=darwin --arch=arm64
electron-packager ./ F1MV-DiscordRPC --platform=darwin --arch=x64
echo 'Building Darwin completed'
echo 'Building Linux'
electron-packager ./ F1MV-DiscordRPC --platform=linux --arch=arm64
electron-packager ./ F1MV-DiscordRPC --platform=linux --arch=x64
echo 'Building Linux completed'
echo 'Removing useless files...'
rm -rf ./F1MV-DiscordRPC-darwin-*/LICENSE*
rm -rf ./F1MV-DiscordRPC-darwin-*/version
echo 'Useless files removed'
echo 'Zipping files...'
zip F1MV-DiscordRPC-linux-arm64.zip ./F1MV-DiscordRPC-linux-arm64/* -r
zip F1MV-DiscordRPC-linux-x64.zip ./F1MV-DiscordRPC-linux-x64/* -r
zip F1MV-DiscordRPC-win32-x64.zip ./F1MV-DiscordRPC-win32-x64/* -r
echo 'Zippied files done'
echo 'Create Applications folder alias'
ln -s /Applications ./F1MV-DiscordRPC-darwin-arm64/Applications
ln -s /Applications ./F1MV-DiscordRPC-darwin-x64/Applications
echo 'Create Applications folder alias done'
echo 'Create the .dmg file'
hdiutil create -srcfolder ./F1MV-DiscordRPC-darwin-arm64 ./F1MV-DiscordRPC-darwin-arm64.dmg
hdiutil create -srcfolder ./F1MV-DiscordRPC-darwin-x64 ./F1MV-DiscordRPC-darwin-x64.dmg
echo '.dmg file created'
echo 'Building completed'