#!/bin/sh

# Setup the compile enviroment with Akhil Narang's setup script
git clone https://github.com/akhilnarang/scripts/
sh ./scripts/setup/android_build_env.sh
cd ..
rm -rf cscript/scripts
# Clone the latest proton-clang by Kdrag0n
git clone https://github.com/kdrag0n/proton-clang
# Clone AnyKernel3
git clone https://github.com/Daisy-Q-sources/AnyKernel3




