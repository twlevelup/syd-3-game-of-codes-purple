require 'player'
require 'timer'
require 'ground'
require 'platform'
require 'backdrop'
require 'goldchain'
require 'goldchainrapper'
require 'counter'

game = {}

local gravity = 1000
local wind = 0
kanyeMusicSource = love.audio.newSource("assets/songs/kanyeSong.mp3")

function game:init()
  self.entities = {}
  self.stageElements = {}
  self.platforms = {}

  self.ground = Ground:new(love, {wind = wind})
  self.player = Player:new(love, {gravity = gravity, wind = wind})
  self.timer = Timer:new(love, {timeLimit = 110})
  self.counter = Counter:new(love, {count = 0, interval = 10, maxcount = 40})
  self.backdrop = Backdrop:new(love)

  -- self.goldchain1 = GoldChain:new(love, {x = 130, y = 382})
  self.goldchain1 = GoldChain:new_random(love)
  self.goldchain2 = GoldChain:new(love, {x = 250, y = 252})
  self.goldchainrapper1 = GoldChainRapper:new(love, {x = 440, y = 208})
  self.goldchainrapper2 = GoldChainRapper:new(love, {x = 390, y = 68})

  table.insert(self.platforms, Platform:new(love, {x = 130, y = 410}))
  table.insert(self.platforms, Platform:new(love, {x = 370, y = 410}))
  table.insert(self.platforms, Platform:new(love, {x = 610, y = 410}))
  table.insert(self.platforms, Platform:new(love, {x = 210, y = 280}))
  table.insert(self.platforms, Platform:new(love, {x = 440, y = 280}))
  table.insert(self.platforms, Platform:new(love, {x = 340, y = 140}))

  table.insert(self.stageElements, self.backdrop)
  table.insert(self.stageElements, self.counter)
  table.insert(self.stageElements, self.timer)


  table.insert(self.entities, self.ground)
  table.insert(self.entities, self.player)

  table.insert(self.entities, self.platforms[1])
  table.insert(self.entities, self.platforms[2])
  table.insert(self.entities, self.platforms[3])
  table.insert(self.entities, self.platforms[4])
  table.insert(self.entities, self.platforms[5])
  table.insert(self.entities, self.platforms[6])

  table.insert(self.entities, self.goldchain1)
  table.insert(self.entities, self.goldchain2)
  table.insert(self.entities, self.goldchainrapper1)
  table.insert(self.entities, self.goldchainrapper2)

  kanyeMusicSource:play();
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
                local result = entity:collidingWith(other)
                if(result) then
                    entity:collide(other, result)
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
