#!/bin/sh


# OSX Preference
defaults write -g com.apple.sound.beep.feedback -integer 0;
defaults write com.apple.screencapture type -string "png";
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true;
defaults write com.apple.finder AppleShowAllFiles -bool true;

# Brew Install
if [ ! which brew >/dev/null ]; then
  ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
fi

brew update;
brew doctor;

# Install Git
if [$(brew --prefix git) != "/usr/local/opt/git" ]; then
  brew install git;
fi

git config --global color.ui true;
git config --global core.pager cat;
git config --global log.abbrevCommit true;
git config --global grep.extendedRegexp true;
