#!/bin/sh
currentDir=$(pwd)
currentDirName=$(basename "$currentDir")
devDirName="hoi4-mod-test"
destinationName="hoi4_mod_test"
if [ $currentDirName==$devDirName ] ; then
{
    destinationName="../$destinationName"
}
elif [ -d "$currentDir/$devDirName"] ; then
{
    currentDir="$currentDir/$devDirName"
}
else
{
    echo "$devDirName doesn't exist"
    exit 1
}
fi

if [ -d $destinationName ] ; then
    echo "$destinationName exists, deleting"
    rm -rfd $destinationName
fi

mkdir $destinationName
rsync -avhm --include='/thumbnail.jpg' --include='/descriptor.mod' --include='/README.md' --exclude='*.7z' --exclude='/*.*' --exclude='/.*' --exclude='/tutorial' --exclude='*.sh' --exclude='*.ps1' --exclude='*.psd' --exclude='*.py' . $destinationName
cp -f "$destinationName/descriptor.mod" "$destinationName/../hoi4-mod-test.mod"
