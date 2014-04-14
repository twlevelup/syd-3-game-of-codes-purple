require 'input'
require 'version'
require 'game'
require 'pause'

love.animation = require 'vendor/anim8'
Gamestate = require "vendor/gamestate"

-- The quit keybinding works from any state:
function love.update(dt)
  if love.input.pressed('quit') then
    love.event.quit()
  end
end

function love.load()
    print("Version: " .. version)

    love.input.bind('left', 'left')
    love.input.bind('right', 'right')
    love.input.bind('down', 'down')
    love.input.bind(' ', 'jump')
    love.input.bind('q', 'quit')
    love.input.bind('escape', 'pause')

    Gamestate.registerEvents()
    Gamestate.switch(game)
end
