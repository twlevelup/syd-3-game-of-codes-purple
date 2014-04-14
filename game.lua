require 'player'
require 'timer'
require 'ground'
require 'platform'
require 'backdrop'

game = {}

local gravity = 1000
local wind = 0

function game:init()
  self.entities = {}
  self.stageElements = {}
  self.ground = Ground:new(love, {wind = wind})
  self.player = Player:new(love, {gravity = gravity, wind = wind})
  self.timer = Timer:new(love, {timeLimit = 110})
  self.backdrop = Backdrop:new(love)

  table.insert(self.stageElements, self.backdrop)
  table.insert(self.stageElements, self.timer)

  table.insert(self.entities, self.ground)
  table.insert(self.entities, self.player)
end

function game:enter()
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
    --Draw all entities
    for _, e in pairs(self.stageElements) do
        e:draw()
    end

    --Draw all entities
    for _, e in pairs(self.entities) do
        e:draw()
    end
end

function game:keyreleased(key)
    if key == love.input.mapping['pause'] then
        Gamestate.push(pause)
    end
end
