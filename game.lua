require 'player'
require 'timer'
require 'ground'
require 'platform'

game = {}

local gravity = 1000
local wind = -100

function game:init()
  self.background = love.graphics.newImage("/assets/images/skyline-bg.png")
end

function game:enter()
  self.entities = {}
  self.stageElements = {}
  self.ground = Ground:new(love, {wind = wind})
  self.player = Player:new(love, {gravity = gravity, wind = wind})
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

function game:keyreleased(key)
    if key == love.input.mapping['pause'] then
        Gamestate.push(pause)
    end
end
