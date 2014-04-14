require 'input'
require 'player'
require 'obstacle'
require 'timer'
require 'ground'
require 'version'

love.animation = require 'vendor/anim8'
Gamestate = require "vendor/gamestate"
states = require 'states'

game = {}

function game:start()
  Gamestate.switch(states.stage1, self)
end

function game:pause()
  Gamestate.push(states.pause, self)
end

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
    love.input.bind('escape', 'quit')
    love.input.bind('p', 'pause')

    Gamestate.registerEvents()
    game:start()
end
