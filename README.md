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
### Mac

Install:

1. [Ruby](#ruby_mac)
2. [Homebrew](#homebrew_mac)
3. [Git](#git_mac)
4. [Lua](#lua_mac)
5. [LuaRocks](#luarocks_mac)
6. [Busted](#busted_mac)

<a name="ruby_mac"/>
### Installing Ruby via RVM
The installation of [Homebrew](http://brew.sh/) requires ruby to be installed on your Mac. You can check that ruby is installed by:

1. Open a terminal.
2. Type `which ruby`. *If a path is present then carry on with step 3, otherwise continue to [Installing Homebrew](#homebrew)*.
3. To install Ruby, simply install it with [RVM](http://rvm.io/). The following command can be run:
  * `\curl -sSL https://get.rvm.io | bash -s stable --ruby` *(This will install RVM _AND_ the latest version of Ruby)*.

<a name="homebrew_mac"/>
### Installing Homebrew

1. Open a terminal.
2. Install [Homebrew](http://brew.sh/) by running:

  * `ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"`

<a name="git_mac"/>
#### Installing Git

1. Open a terminal.
2. Install Git by running `brew install git`.
3. Once installed, open a terminal.
4. Configure your username:
  * `git config --global user.name "Your Name Here"`
5. Configure your email:
  * `git config --global user.email "your_email@example.com"`
6. Add a public SSH key to your [GitHub](https://github.com/) account.

<a name="lua_mac"/>
#### Installing Lua

1. Open a terminal.
2. Type:
  * `brew install lua`

<a name="luarocks_mac"/>
#### Installing LuaRocks

1. Open a terminal.
2. Type:
  * `brew install luarocks`

<a name="busted_mac"/>
#### Installing Busted

1. Open a terminal.
2. Type:
  * `luarocks install busted`

<a name="love_mac"/>
#### Installing Love
1. Install [LÖVE](http://love2d.org/) to your applications folder.
2. Open a terminal.
3. Add an alias in your ~/.bash_profile (or your shell of choice's config) to LÖVE:

        alias love="/Applications/love.app/Contents/MacOS/love"
