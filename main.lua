require 'input'
require 'version'
require 'game'

love.animation = require 'vendor/anim8'
Gamestate = require "vendor/gamestate"

function love.load()
    print("Version: " .. version)

    love.input.bind('left', 'left')
    love.input.bind('right', 'right')
    love.input.bind('down', 'down')
    love.input.bind(' ', 'space')
    Gamestate.registerEvents()
    Gamestate.switch(game)
end

