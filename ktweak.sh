# Remove old ktweak folder
rm -rf ktweak

# Download the latest release as Ktweak.zip to our current directory
LOCATION=$(curl -s https://api.github.com/repos/Magisk-Modules-Alt-Repo/ktweak/releases/latest \
| grep "tag_name" \
| awk '{print "https://github.com/Magisk-Modules-Alt-Repo/ktweak/archive/" substr($2, 2, length($2)-3) ".zip"}') \
; curl -L -o ktweak.zip $LOCATION

# Zip up just the ktweak stuff not the whole release folder (haven't found a better way to do this yet)
unzip ktweak.zip -d ./ktweak
cd ktweak
lsd=$(ls -d */|head -n 1)
cd $lsd
zip -r9 ktweak.zip *
cd ..
cd ..
cp ktweak/$lsd/ktweak.zip .
echo $lsd > ktweak.version
