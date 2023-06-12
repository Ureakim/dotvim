cd nvim-src
git checkout master
git pull
git fetch --tags --force
git checkout stable
make distclean
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
