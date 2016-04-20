#!/bin/bash

# user
username=$(whoami)
atomDir=/home/$username/.atom
# move to my home fodler
cd /home/$username

echo "Downloading temp repo.."
git clone https://github.com/juliomatcom/atom-configuration-pkgs.git
echo "======================================"
filename=atom-configuration-pkgs/packages.txt

echo "Install missing packages"
while read package
do
  directory="$atomDir/packages/$package"
  echo $directory
  if [ ! -d $directory ]; then
    echo "apm install $package"
    apm install $package
  fi
done < $filename
echo "======================================"

echo "Copy configurations files to $atomDir"
#copy files
cp atom-configuration-pkgs/confs/* $atomDir/.
echo "======================================"

# remove repo
echo "Removing temp repo..."
rm -rf atom-configuration-pkgs
echo "======================================"
echo "done"
