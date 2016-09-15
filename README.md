# Mac OS X Dev Setup

## Summary

- [Installing](#installing)
- [OS X](#os-x)
  - [Preferences](#os-x-preferences)
  - [Install](#install)
- [Git](#git)
  - [Best tool or script for Git](#best-tool-or-script-for-git)
- [Application](#application)
  - [Intellij](#intellij)
    - [Saut de ligne](#saut-de-ligne)
    - [Import inutile](#import-inutile)
  - [iterm2](#iterm2)
  - [Spectacle](#spectacle)
- [Java](#java)
  - [Java tools](#java-tools)
    - [Template](#template)
  - [Styleguide Java](#styleguide-java)
    - [Enum](#enum)
    - [toString and get](#tostring-and-get)
    - [Optimisation](#optimisation)
- [Android](#android)
  - [Android Tools](#android-tools)
- [JavaScript](#javascript)
  - [JavaScript Tutorial](#javascript-tutorial)


## Installing

```
$ git clone git@github.com:ctesniere/mac-osx-dev-setup.git ~/.mac-osx-dev-setup
```

And create symlinks for files dotfile (show explanation below)

## OS X

### Preferences

```bash
# Disable sound effect when changing volume 
$ defaults write -g com.apple.sound.beep.feedback -integer 0

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
$ defaults write com.apple.screencapture type -string "png"


###############################################################################
# Finder                                                                      #
###############################################################################

# Show icons for hard drives, servers, and removable media on the desktop
$ defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
$ defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
$ defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
$ defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Show hidden files by default
$ defaults write com.apple.finder AppleShowAllFiles -bool true

# Show all filename extensions in Finder
$ defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show Path bar in Finder
$ defaults write com.apple.finder ShowPathbar -bool true

# Show Status bar in Finder
$ defaults write com.apple.finder ShowStatusBar -bool true

# Enable text copying from Quick Look
$ defaults write com.apple.finder QLEnableTextSelection -bool YES

# Show absolute path in finder's title bar. 
$ defaults write com.apple.finder _FXShowPosixPathInTitle -bool YES

# Use current directory as default search scope in Finder
$ defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
 
# Disable the warning when changing a file extension
$ defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Avoid creating .DS_Store files on network volumes
$ defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Disable automatic rearrangement of spaces based on most recent usage
$ defaults write com.apple.dock mru-spaces -bool false

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: icnv, Nlmv, Flwv
$ defaults write com.apple.finder FXPreferredViewStyle -string "Nlmv"

# AirDrop by ethernet
$ defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1 

###############################################################################
# Safari & WebKit                                                             #
###############################################################################

# Enable Safari’s debug menu
$ defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# Enable the Develop menu and the Web Inspector in Safari
$ defaults write com.apple.Safari IncludeDevelopMenu -bool true
$ defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
$ defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
$ defaults write NSGlobalDomain WebKitDeveloperExtras -bool true



# /!\ For apply change
$ killall Dock

# from this source:
# https://gist.github.com/benfrain/7434600
```

## Install

```bash
# Homebrew (http://brew.sh/)
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
$ brew update
$ brew doctor
```

Install [brew-cask](https://github.com/caskroom/homebrew-cask)

```bash
$ brew install caskroom/cask/brew-cask
```

Quick Look plugin

```bash
$ brew cask update

# Inspect the contents of compressed archives
$ brew cask install betterzipql

# Syntax highlighting
$ brew cask install qlcolorcode

# QuickLook generator for Markdown files
$ brew cask install qlmarkdown

# A QuickLook plugin that lets you view plain text files without a file extension
$ brew cask install qlstephen

# Preview JSON files
$ brew cask install quicklook-json

# Display image size and resolution
$ brew cask install qlimagesize

# Preview the contents of a standard Apple installer package
$ brew cask install suspicious-package
```

```bash
# Node
$ brew install node
```

```bash
# Bonus
$ npm install --global osx-trash # https://github.com/sindresorhus/node-osx-trash
```

```bash
# jenv
$ brew install jenv
$ echo 'export PATH="$HOME/.jenv/bin:$PATH"' >> ~/.zshrc
$ echo 'eval "$(jenv init -)"' >> ~/.zshrc
$ jenv enable-plugin maven
```

## Git
### Best tool or script for Git

* [k4rthik/git-cal](https://github.com/k4rthik/git-cal)  
Github like contributions calendar on terminal.
* [tj/git-extras](https://github.com/tj/git-extras)  
GIT utilities -- repo summary, repl, changelog population, author commit percentages and more
* [tiimgreen/github-cheat-sheet](https://github.com/tiimgreen/github-cheat-sheet)  
A list of cool features of Git and GitHub.
* [sickill/git-dude](https://github.com/sickill/git-dude)  
git-dude is a simple git desktop notifier. It monitors git repositories in current directory for new commits/branches/tags and shows desktop notification if anything new arrived.
* [nvie/gitflow](https://github.com/nvie/gitflow)  
Git extensions to provide high-level repository operations.
* [git-up/GitUp](https://github.com/git-up/GitUp)  
The Git interface you've been missing all your life has finally arrived. http://gitup.co


## Application

### Intellij
#### Added configuration

```
$ ln -s ~/.mac-osx-dev-setup/jetbrains/IntelliJIdea13/inspection/Default.xml ~/Library/Preferences/IntelliJIdea13/inspection/Default.xml
$ ln -s ~/.mac-osx-dev-setup/jetbrains/IntelliJIdea13/codestyles/Perso.xml ~/Library/Preferences/IntelliJIdea13/codestyles/Perso.xml
```

#### Saut de ligne

Afin d'ajouter un saut de ligne à vos fichier automatiquement :  
`IDE Settings / Editor` et sélectionner `Ensure line feed at file end on saving`

#### Import inutile

Dans la plupart des cas, il y a des imports que l'on va ne va utiliser. Dans "Settings/Auto Import", ajouter ceci à la liste des exclusions :

```
com.google.api.client.repackaged
com.google.api.client.util
com.google.appengine.repackaged
```


### iterm2

Download and install [iTerm2](http://iterm2.com/).   
Load preferences from this Github depot. In **iTerm > Preferences**, under the tab General, and paste in **Load preferences from a custom folder or URL** with this url :  
*https://raw.githubusercontent.com/ctesniere/trick/master/iterm/com.googlecode.iterm2.plist*


### Spectacle

Move and resize windows with ease. Download [spectacleapp](http://spectacleapp.com/).


## Java

### Java Tools
#### Template

* [Velocity](http://velocity.apache.org/engine/devel/developer-guide.html)  
Moteur de template pour document ou mail

## Android
### Android Tools

* [Android Studio](https://developer.android.com/sdk/index.html) The official Android IDE
* [Genymotion](https://www.genymotion.com/) Genymotion is a fast and easy-to-use Android emulator to run and test your Android apps. AOSP-based for perfect Android compliance, 20 pre-configured devices, CPU and OpenGL acceleration, etc.

## JavaScript

## JavaScript Tutorial

* (HTML5Rocks) [JS debugging asynchronous with Chrome DevTools](http://www.html5rocks.com/fr/tutorials/developertools/async-call-stack/)  
* (HTML5Rocks) [JavaScript Promises](http://www.html5rocks.com/fr/tutorials/es6/promises/)  
