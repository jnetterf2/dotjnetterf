#!/bin/sh
dot_install=`pwd`

set -e

# Clean
rm -fr ~/.config/jnetterf > /dev/null 2>&1 || true

# Install main tools/config
cd $dot_install
mkdir -p ~/.config/jnetterf/etc
cp -fr ./etc/* ~/.config/jnetterf/etc/

mkdir -p ~/.config/jnetterf/bin
cp -fr ./bin/* ~/.config/jnetterf/bin

# Setup clipboard
read -p "Enter a clipboard github url (ALL HISTORY WILL BE REMOVED): " clipboard_url
./bin/hsinst.sh $clipboard_url

curl http://fishshell.com/files/2.2.0/fish-2.2.0.tar.gz > /tmp/fish.tar.gz
cd /tmp
tar -xf fish.tar.gz

# Setup fish
cd ./fish-2.2.0
./configure --prefix=$HOME/.config/jnetterf/
make
make install

# Fish config path cannot be changed (crashes when xdg paths are set)
mv ~/.config/fish ~/.config/fish.dotjnetterf_hold
ln -s ~/.config/jnetterf/etc/fish ~/.config/fish

echo DONE
