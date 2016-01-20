#!/bin/bash
function usage {
    echo $0: usage shared_git_repo;
    echo git must be able to access the shared git repo without a password
    exit 1
}
test "q$1" != "q" || usage;

echo WARNING: Calling hscopy will REMOVE ALL HISTORY from $1
while true; do
    read -p "Do you wish to continue? [yn]" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit 1;;
        * ) echo "Please answer yes or no.";;
    esac
done

mkdir -p ~/.config/jnetterf/etc/hscopy
echo $1 > ~/.config/jnetterf/etc/hscopy/reponame
repo_url=`cat ~/.config/jnetterf/etc/hscopy/reponame`

cd ~/.config/jnetterf/etc/hscopy
rm -fr ./repo > /dev/null 2>&1 || true
git clone $repo_url repo
cd repo
git commit --allow-empty -m "Init clipboard repo"
