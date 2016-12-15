#!/usr/bin/env bash

source ./utils.sh

e_header "Installing brew utilities"

binaries=(
    android-platform-tools
    bash
    boost
    boost-python
    cmake
    coreutils
    curl
    dialog
    faac
    ffmpeg
    figlet
    findutils
    git
    git-extras
    git-fresh
    graphicsmagick
    # heroku # This is an incredibly old version of the CLI for some reason (v3.4.x, current is v5.x)
    htop
    httpie
    hub
    imagemagick
    # imagesnap # DOES NOT COMPILE ON macOS
    # imgcat # SHA256 mismatch
    jp2a
    keybase
    libmemcached
    m-cli
    memcached
    ncdu
    normalize
    pv
    pyenv
    pyenv-virtualenv
    rbenv
    ruby-build
    shml
    spaceman-diff
    sslmate
    sudolikeaboss
    tree
    wget
    wifi-password
    you-get
    youtube-dl
)

brew tap ravenac95/sudolikeaboss
brew tap pebble/pebble-sdk
brew tap colinstein/imgcat

e_arrow "Installing brew packages"

brew install TomAnthony/brews/itermocil
brew install ${binaries[@]}
# Fixes the ffmpeg install
# brew reinstall ffmpeg --with-faac

e_arrow "Installing GNU version of utils"

brew tap homebrew/dupes
gbinaries=(
  grep
  gnu-sed
)
brew install ${gbinaries[@]} --with-default-names


e_arrow "Installing joe for gitignore files"

# curl -Lo ~/bin/joe https://github.com/karan/joe/releases/download/1.0.1/joe
# chmod +x ~/bin/joe

brew cleanup

e_success "Done!"
