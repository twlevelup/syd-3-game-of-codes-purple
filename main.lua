require 'input'
require 'player'
require 'obstacle'
require 'timer'
require 'ground'
require 'version'

love.animation = require 'vendor/anim8'
Gamestate = require "vendor/gamestate"

local game = {}

function game:init()
  self.background = love.graphics.newImage("/assets/images/skyline-bg.png")
end

function game:enter()
  self.entities = {}
  self.stageElements = {}
  self.ground = Ground:new(love)
  self.player = Player:new(love)
  self.timer = Timer:new(love, {timeLimit = 110})
  table.insert(self.entities, self.ground)
  table.insert(self.entities, self.player)
  table.insert(self.stageElements, self.timer)
end

function game:update(dt)
  for _, entity in pairs(self.stageElements) do
      entity:update(dt)
  end
  for _, entity in pairs(self.entities) do
        entity:update(dt)
        for _, other in pairs(self.entities) do
            if other ~= entity then
                if entity:collidingWith(other) then
                    entity:collide(other)
                end
            end
        end
    end
end

function game:draw()
    --Draw background
    sx = love.window.getWidth() / self.background:getWidth()
    love.graphics.draw(self.background, 0, 0, 0, sx, sx)

    --Draw all entities
    for _, e in pairs(self.entities) do
        e:draw()
    end

    --Draw stage elements
    for _, e in pairs(self.stageElements) do
        e:draw()
    end
end

function love.load()
    print("Version: " .. version)

    love.input.bind('left', 'left')
    love.input.bind('right', 'right')
    love.input.bind('down', 'down')
    love.input.bind(' ', 'jump')
    love.input.bind('escape', 'quit')
    Gamestate.registerEvents()
    Gamestate.switch(game)
end

