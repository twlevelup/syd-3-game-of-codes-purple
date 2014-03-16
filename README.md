# LevelUp Build - Game of Codes

[![Build Status](https://travis-ci.org/twlevelup/syd-3-game-of-codes.png?branch=master)](https://travis-ci.org/twlevelup/syd-3-game-of-codes)


## Developer Environment Setup

Jump to instructions for:

1. [Mac](#mac)
2. [Ubuntu](#ubuntu)
3. [Windows](#windows)

What's next?

1. Try [honing](http://try.github.io/levels/1/challenges/1) your Git skills!
2. The [Lua Reference Manual](http://www.lua.org/manual/5.1/index.html#contents) is a good place for all your API questions.
3. Check out the Busted [usage examples](http://olivinelabs.com/busted/).
4. Check out out how to [get started](http://www.love2d.org/wiki/Getting_Started) with LÖVE.


<a name="mac"/>
## Mac

Install the following applications:

1. [Ruby](#ruby_mac)
2. [Homebrew](#homebrew_mac)
3. [Git](#git_mac)
4. [Lua](#lua_mac)
5. [LuaRocks](#luarocks_mac)
6. [Busted](#busted_mac)
7. [Love](#love_mac)

<a name="ruby_mac"/>
### Installing Ruby via RVM
The installation of [Homebrew](http://brew.sh/) requires ruby to be installed on your Mac. You can check that ruby is installed by:

1. Open a terminal and type:

        which ruby
        
    *Note: If a path is present then carry on with step 2, otherwise move to [Installing Homebrew](#homebrew)*.
        
2. To install Ruby, simply install it with [RVM](http://rvm.io/). Run the following command from the terminal:

        \curl -sSL https://get.rvm.io | bash -s stable --ruby`
        
    *Note: This will install RVM _AND_ the latest version of Ruby*.

<a name="homebrew_mac"/>
### Installing Homebrew

1. Open a terminal and type:

        ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

<a name="git_mac"/>
### Installing Git

1. Open a terminal and type:

        brew install git

2. Configure your username:

        git config --global user.name "Your Name Here"

3. Configure your email:

        git config --global user.email "your_email@example.com"

4. Add a public SSH key to your [GitHub](https://github.com/) account.

<a name="lua_mac"/>
### Installing Lua

1. Open a terminal and type:

        brew install lua

<a name="luarocks_mac"/>
### Installing LuaRocks

1. Open a terminal and type:

        brew install luarocks

<a name="busted_mac"/>
### Installing Busted

1. Open a terminal and type:

        luarocks install busted

<a name="love_mac"/>
### Installing Love

1. Install [LÖVE](http://love2d.org/) to your applications folder.
2. Open a terminal and add an alias in your ~/.bash_profile (or your shell of choice's config) to LÖVE:

        alias love="/Applications/love.app/Contents/MacOS/love"


<a name="ubuntu"/>
## Ubuntu

Install the following applications:

1. [Git](#git_ubuntu)
2. [Lua](#lua_ubuntu)
3. [LuaRocks](#luarocks_ubuntu)
4. [Busted](#busted_ubuntu)
5. [Love](#love_ubuntu)

<a name="git_ubuntu"/>
### Installing Git

1. Open a terminal and type:

        sudo apt-get install git -y

2. Configure your username:

        git config --global user.name "Your Name Here"

3. Configure your email:

        git config --global user.email "your_email@example.com"

4. Add a public SSH key to your [GitHub](https://github.com/) account.

<a name="lua_ubuntu"/>
### Installing Lua

1. Open a terminal and type:

        sudo apt-get install lua -y

<a name="luarocks_ubuntu"/>
### Installing LuaRocks

1. Open a terminal and type:

        sudo apt-get install luarocks -y

<a name="busted_ubuntu"/>
### Installing Busted

1. Open a terminal and type:

        luarocks install busted

<a name="love_ubuntu"/>
### Installing Love

1. Open a terminal and type:

        sudo add-apt-repository ppa:bartbes/love-stable -y
        sudo apt-get update
        sudo apt-get install love -y

<a name="windows"/>
## Windows

Setting up the required development environment in windows is not for the feint hearted. Therefore, we will provide you with a Vagrant Box and File (configured for Ubuntu) via USB when attending.

For this setup, install the following applications:

1. [VirtualBox](#virtualbox)
2. [Vagrant](#vagrant)

<a name="virtualbox"/>
### Installing VirtualBox

1. Download and install the VirtualBox [installer](http://download.virtualbox.org/virtualbox/4.3.8/VirtualBox-4.3.8-92456-Win.exe).

<a name="vagrant"/>
### Installing Vagrant

1. Download and install the Vagrant [installer](https://dl.bintray.com/mitchellh/vagrant/vagrant_1.5.1.msi).
