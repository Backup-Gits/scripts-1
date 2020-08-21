# Remove old ktweak folder
rm -rf ktweak

# Download the latest release as Ktweak.zip to our current directory
LOCATION=$(curl -s https://api.github.com/repos/Magisk-Modules-Alt-Repo/ktweak/releases/latest \
| grep "tag_name" \
| awk '{print "https://github.com/Magisk-Modules-Alt-Repo/ktweak/archive/" substr($2, 2, length($2)-3) ".zip"}') \
; curl -L -o ktweakm.zip $LOCATION

# Zip up just the ktweak stuff not the whole release folder (haven't found a better way to do this yet)
rm -rf ktweakm
unzip ktweakm.zip -d ./ktweakm
cd ktweakm
lsd=$(ls -d *|head -n 1)
rm -rf /home/lacia/keso/AnyKernel3/$lsd
cp -r $(pwd)/$lsd /home/lacia/keso/AnyKernel3
cd ..
echo $lsd > ktweak.version
