# user
username=whoami
atomDir = /home/$username/.atom
# move to my home fodler
cd /home/$username

echo "Downloading repo... "
git clone https://github.com/juliomatcom/atom-configuration-pkgs.git

apm install --packages-file atom-configuration-pkgs/packages.txt

echo "Copy configurations files to ${atomDir}"
#copy files
cp atom-configuration-pkgs/init.coffee  $atomDir/init.coffee
cp atom-configuration-pkgs/keymap.cson $atomDir/keymap.cson
cp atom-configuration-pkgs/toolbar.cson $atomDir/toolbar.cson


# remove repo
echo "Removing extra files..."
rm -rf atom-configuration-pkgs
