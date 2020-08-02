# Main Environment
export CORES=$(grep -c ^processor /proc/cpuinfo)
export THREAD="-j$CORES"
export KERN_IMG="/$pwd/kernel/out/arch/arm64/boot/Image.gz-dtb"
export BUILD_START=$(date +"%s")
export DATE=`date`
export PARSE_BRANCH="$(git rev-parse --abbrev-ref HEAD)"
export COMMIT_POINT="$(git log --pretty=format:'%h : %s' -1)"
export PATH="/$pwd/proton-clang/bin:$PATH"
export KBUILD_COMPILER_STRING="$(/$pwd/proton-clang/bin/clang --version | head -n 1 | perl -pe 's/\((?:http|git).*?\)//gs' | sed -e 's/  */ /g' -e 's/[[:space:]]*$//')";

# Clone my private repository for the CHATID and BOTTOKEN
git clone https://github.com/Lyceris-chan/telegram_bot_api_stuff bapi

# Export the BOTTOKEN and CHATID from my private repository
export BOTTOKEN="$(sed 's/BOTTOKEN = //g' /$pwd/bapi/bottoken.txt)"
export CHATID="$(sed 's/CHATID = //g' /$pwd/bapi/chatid.txt)"


# Figure out the localversion
rm -rf localversion.txt
grep "SUBLEVEL =" Makefile > localversion.txt
export SUBLVL="$(sed 's/SUBLEVEL = //g' localversion.txt)"
export LOCALVERSION=4.9.$SUBLVL

