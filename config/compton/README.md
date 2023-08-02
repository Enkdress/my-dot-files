Install meson
clone the compton repository https://github.com/tryone144/picom.git
cd into the repository
run git submodule update --init --recursive
run meson --buildtype=release . build
run ninja -C build
run ninca -C build install
