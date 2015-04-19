mvj3 devkit
======================================

Editor
--------------------------------------
Main     : MacVim
Plugin   : janus
Install  : cd ~/.vim; rake

Shell
--------------------------------------
Main     : Zsh
Plugin   : oh-my-zsh


Homebrew (The missing package manager for OS X)
--------------------------------------
```zsh
brew tap homebrew/science # a lot of cool formulae for scientific tools
brew tap homebrew/python # numpy, scipy
brew tap homebrew/versions
brew tap homebrew/binary
brew tap staticfloat/julia

brew tap phinze/homebrew-cask
brew install brew-cask
brew cask install google-chrome dropbox \
                  alfred wireshark the-unarchiver evernote \
                  gitx quicklook-csv quicklook-json java \
                  virtualbox vagrant macvim iterm2 robomongo \
                  sequel-pro rstudio r \
                  intellij-idea \
                  vlc
brew install mplayer

brew install readline gettext libffi pcre libevent libyaml freetype jpeg libpng libtiff fontconfig
brew install gcc gfortran cmake openssl cscope libtool glib libgcrypt pkg-config
brew install scala fftw open-mpi libmpc ccache parallel
brew install mysql redis postgresql mongodb memcached valgrind erlang go node phantomjs lua v8 neo4j
brew install mercurial git svn zsh htop-osx unrar grc tree ack
brew install nload
brew install nvm pyenv pyenv-ccache autoenv
brew install gradle
```

Manager crons
--------------------------------------
[sudo] launchctl load/unload ~/Library/LaunchAgents/com.mvj3.alert.plist
