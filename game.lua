require 'abstract/stage'
require 'startscreen'
require 'timer'
require 'goldchain'
require 'goldchainrapper'
require 'counter'
require 'stageTransition'
require 'wonState'

game = {}
game.__index = game
setmetatable(game, {__index = stage})

kanyeMusicSource = love.audio.newSource("assets/songs/kanyeSong.mp3")

function game:init()
    stage.init(self)
    self.timer = Timer:new(love, {timeLimit = 110})
    self.counter = Counter:new(love, {count = 0, interval = 10, maxcount = 40})
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

    table.insert(self.stageElements, self.timer)
    table.insert(self.stageElements, self.counter)

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
    kanyeMusicSource:play()
end

function game:enter()
    Gamestate.push(startscreen)
end

function game:beforepause()
    kanyeMusicSource:pause()
end

function game:haswon()
    return (self.timer.finished or self.counter._allCollected)
end

function game:finish()
    -- Loss
    if self.timer.finished and not self.counter._allCollected then
        Gamestate.push(stageTransition)
    else -- Win
        if not self.glasses then
            Gamestate.push(wonState)
        else -- The rabbit hole
            Gamestate.push(windy)
        end
    end
end
