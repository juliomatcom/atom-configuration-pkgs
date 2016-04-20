#!/bin/bash

# user
username=$(whoami)
atomDir=/home/$username/.atom
# move to my home fodler
cd /home/$username

echo "Downloading temp repo... "
git clone https://github.com/juliomatcom/atom-configuration-pkgs.git

filename=atom-configuration-pkgs/packages.txt

#Install missing packages only
while read package
do
  directory="$atomDir/packages/$package"
  echo $directory
  if [ ! -d $directory ]; then
    echo "apm install $package"
    apm install $package
  fi
done < $filename

echo "Copy configurations files to $atomDir"
#copy files
cp atom-configuration-pkgs/confs/. $atomDir/.

# remove repo
echo "Removing temp repo..."
rm -rf atom-configuration-pkgs

echo "done"
