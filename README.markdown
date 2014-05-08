mvj3 的日常使用工具集
======================================


武器库
--------------------------------------
* MacVim   使用 janus         来管理。
* Zsh      使用 oh-my-zsh     来管理。

Homebrew (The missing package manager for OS X)
--------------------------------------
```zsh
brew tap homebrew/science # a lot of cool formulae for scientific tools
brew tap homebrew/python # numpy, scipy
brew tap homebrew/versions

brew tap phinze/homebrew-cask
brew install brew-cask
brew cask install google-chrome dropbox \
                  alfred wireshark the-unarchiver evernote \
                  gitx quicklook-csv quicklook-json java \
                  virtualbox vagrant macvim iterm2 \
                  sequel-pro rstudio r \
                  vlc
brew install mplayer

brew install readline gettext libffi pcre libevent libyaml freetype jpeg libpng libtiff fontconfig
brew install gcc gfortran cmake openssl cscope libtool glib libgcrypt pkg-config
brew install scala fftw open-mpi libmpc
brew install mysql redis postgresql mongodb memcached valgrind erlang go node phantomjs lua v8 neo4j
brew install mercurial git svn zsh htop-osx unrar grc
brew install nvm pyenv autoenv
```

管理后台进程服务
--------------------------------------
[sudo] launchctl load/unload ~/Library/LaunchAgents/com.mvj3.alert.plist
