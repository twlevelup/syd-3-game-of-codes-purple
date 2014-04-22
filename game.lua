require 'player'
require 'timer'
require 'ground'
require 'platform'
require 'backdrop'
require 'goldchain'
require 'goldchainrapper'

game = {}

local gravity = 1000
local wind = 0
kanyeMusicSource = love.audio.newSource("assets/songs/kanyeSong.mp3")

function game:init()
  self.entities = {}
  self.stageElements = {}
  self.ground = Ground:new(love, {wind = wind})
  self.player = Player:new(love, {gravity = gravity, wind = wind})
  self.timer = Timer:new(love, {timeLimit = 110})
  self.backdrop = Backdrop:new(love)
  self.platform1 = Platform:new(love, {x = 130, y = 410})
  self.platform2 = Platform:new(love, {x = 370, y = 410})
  self.platform3 = Platform:new(love, {x = 610, y = 410})
  self.platform4 = Platform:new(love, {x = 210, y = 280})
  self.platform5 = Platform:new(love, {x = 440, y = 280})
  self.platform6 = Platform:new(love, {x = 340, y = 140})
  self.goldchain1 = GoldChain:new(love, {x = 130, y = 382})
  self.goldchain2 = GoldChain:new(love, {x = 250, y = 252})
  self.goldchainrapper1 = GoldChainRapper:new(love, {x = 440, y = 208})
  self.goldchainrapper2 = GoldChainRapper:new(love, {x = 390, y = 68})

  table.insert(self.stageElements, self.backdrop)
  table.insert(self.stageElements, self.timer)

  table.insert(self.entities, self.ground)
  table.insert(self.entities, self.player)
  table.insert(self.entities, self.platform1)
  table.insert(self.entities, self.platform2)
  table.insert(self.entities, self.platform3)
  table.insert(self.entities, self.platform4)
  table.insert(self.entities, self.platform5)
  table.insert(self.entities, self.platform6)
  table.insert(self.entities, self.goldchain1)
  table.insert(self.entities, self.goldchain2)
  table.insert(self.entities, self.goldchainrapper1)
  table.insert(self.entities, self.goldchainrapper2)
  
  kanyeMusicSource:play();
end

function game:enter()
  --if kanyeMusicSource:isPaused() then
    --kanyeMusicSource:play()
  --end
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
        kanyeMusicSource:pause()
        Gamestate.push(pause)
    end
end
