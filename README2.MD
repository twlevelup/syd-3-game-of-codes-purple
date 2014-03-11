# LevelUp Build - Game of Codes
## Developer Environment Setup

Jump to instructions for:

1. [Git](#git)
2. [Lua](#lua)
3. [LOVE](#love)
4. [Busted](#busted)
5. [Sublime](#sublime)




# Git
Installation guides for [windows](#git_windows) | [mac osx](#git_osx).

Git is a Version Control System (VCS) used to easily track changes made by developers working on their source code. It will aid developers in maintaining a working code base whilst they work simultaneously across it.

Not too familiar with Git? Why not try [honing](http://try.github.io/levels/1/challenges/1) your Git skills!
<a name="git_windows"/>
#### Windows
For the full list of instructions, please visit the GitHub windows [setup page](https://help.github.com/articles/set-up-git#platform-windows). Otherwise use our quick guide:

1. Download the native [GitHub app](https://github-windows.s3.amazonaws.com/GitHubSetup.exe).
2. Install. The installer will prompt you to sign in and configure your email.
3. Skip adding local repositories.

The GitHub app will allow you to add repositories, clone them to your machine and open a git enabled shell with your default terminal app.

The *GitHub, Inc* folder under *All Programs* within your *Start Menu* will contain the application *Git Shell* with which to open a git enabled terminal, as shown below:

`Start Menu > All Programs > GitHub, Inc > Git Shell`

<a name="git_osx"/>
#### Mac OS X

1. You are required to have [Homebrew](#homebrew_osx) installed to run the following commands.
2. Install Git by running `brew install git`.
3. Once installed, open a terminal.
4. Configure your username:
  * `git config --global user.name "Your Name Here"`
5. Configure your email:
  * `git config --global user.email "your_email@example.com"`
6. [Create](#ssh_keygen) a public/private key.
7. [Upload](#upload_key_github) your public key to your Github account.






# Lua
Installation guides for [windows](#lua_windows) | [mac osx](#lua_osx).

Lua is a lightweight, cross-platform programming language that is utilised by the Corona Labs SDK. It is the programming language that you will be using to write your mobile games in.

The [Lua Reference Manual](http://www.lua.org/manual/5.1/index.html#contents) is a good place for all your API questions.

<a name="lua_windows"/>
#### Windows
For the full list of instructions, please visit the Lua for windows [installation page](https://code.google.com/p/luaforwindows/). Otherwise use our quick guide:

1. Download and install the latest version of [Lua for windows](https://code.google.com/p/luaforwindows/downloads/list).
2. Configuration options:
  * Full Installation
  * De-select LuaRocks

<a name="lua_osx"/>
#### Mac OS X

1. You are required to have [Homebrew](#homebrew_osx) installed to run the following commands.
2. Install Lua by running `brew install lua`.






# Busted
Installation guides for [windows](#busted_windows) | [mac osx](#busted_osx).

Busted is a unit testing framework for the Lua programming language. It is what we will be using to implement **T**est **D**riven **D**evelopment (TDD).

Busted is installed via LuaRocks, the Lua package manager.

Check out the Busted [usage examples](http://olivinelabs.com/busted/).

<a name="busted_windows"/>
#### Windows

For the full list of instructions, please visit the LuaRocks [windows installation page](http://luarocks.org/en/Installation_instructions_for_Windows).

1. Download and install [LuaRocks for Windows](http://luarocks.org/en/Download).
2. Install busted with `luarocks install busted`.

<a name="busted_osx"/>
#### Mac OS X

1. You are required to have [Homebrew](#homebrew_osx) installed to run the following commands.
2. Install LuaRocks by running `brew install luarocks`.
3. Install busted with `luarocks install busted`.



<a name="love_osx"/>
# LÖVE

LÖVE is an *awesome* framework you can use to make 2D games in Lua. It's free, open-source, and works on Windows, Mac OS X and Linux.

1. Install [LÖVE](http://love2d.org/) to your applications folder.
2. Add an alias in your ~/.bash_profile (or your shell of choice's config) to LÖVE:

        alias love="/Applications/love.app/Contents/MacOS/love"




<a name="homebrew_osx"/>
# Installing Homebrew for Mac OS X

1. The installation of [Homebrew](http://brew.sh/) requires ruby to be installed on your Mac. You can check that ruby is installed by running `which ruby` from a terminal. If a path is present then carry on with step 3, otherwise continue with step 2.
2. To install Ruby, simply install it with [RVM](http://rvm.io/). The following command can be run:
  * `\curl -sSL https://get.rvm.io | bash -s stable --ruby` - This will install RVM _AND_ the latest version of Ruby.
3. Install [Homebrew](http://brew.sh/) by running:

  * `ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"`
