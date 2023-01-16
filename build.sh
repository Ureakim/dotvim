cd nvim-src
git checkout stable
git pull
make distclean
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
