require 'abstract/stage'
require 'platform'
require 'startscreen'
require 'clock'
require 'agechain'
require 'counter'
require 'stageTransition'
require 'wonState'
require 'secret/transition'
require 'secret/caption'

game = {}
game.__index = game
setmetatable(game, {__index = stage})

kanyeMusicSource = love.audio.newSource("assets/songs/kanyeSong.mp3")

function game:enter()
    self:reset()
    Gamestate.push(startscreen)
end

function game:reset()
    stage.init(self)
    self.platforms = {}
    self.clock = Clock(love, {timeLimit = 110})
    self.counter = Counter(love, {count = 0, interval = 1, maxcount = 15})
    self.item = nil

    table.insert(self.platforms, Platform(love, {x = 130, y = 410}))
    table.insert(self.platforms, Platform(love, {x = 370, y = 410}))
    table.insert(self.platforms, Platform(love, {x = 610, y = 410}))
    table.insert(self.platforms, Platform(love, {x = 210, y = 280}))
    table.insert(self.platforms, Platform(love, {x = 440, y = 280}))
    table.insert(self.platforms, Platform(love, {x = 340, y = 140}))


    table.insert(self.stageElements, self.counter)
    table.insert(self.stageElements, self.clock)
    table.insert(self.entities, self.platforms[1])
    table.insert(self.entities, self.platforms[2])
    table.insert(self.entities, self.platforms[3])
    table.insert(self.entities, self.platforms[4])
    table.insert(self.entities, self.platforms[5])
    table.insert(self.entities, self.platforms[6])

    kanyeMusicSource:play()
end

function game:update(dt)
    stage.update(self, dt)
    self:dropitem()
end

function game:dropitem()
    if not self.item or self.item.collected or self.item:expired() then
        chain = AgeChain(love)
        if self.item and self.item.collected then self.counter:increase() end
        if self.item then self.item:destroy() end
        self.item = chain
        self.item.x = math.random(0, self.width)
        self.item.y =  math.random(self.height*0.5, self.height*0.8)
        while self:isColliding(self.item) do
            self.item.y =  math.random(self.height*0.5, self.height*0.8)
        end
        table.insert(self.entities, self.item)
    end
end

function game:beforepause()
    kanyeMusicSource:pause()
end

function game:haswon()
    return (self.clock.finished or self.counter._allCollected)
end

function game:finish()
    -- Loss
    if self.clock.finished and not self.counter._allCollected then
        Gamestate.push(stageTransition)
    else -- Win
        if not self.glasses then
            Gamestate.push(wonState)
        else -- The rabbit hole
            kanyeMusicSource:stop()
            Gamestate.push(caption, transition, "You have activated Kanye Mode", 2)
        end
    end
end

function game:isColliding(object)
    if not self.entities or not object then return end
    for _, other in pairs(self.entities) do
        if object ~= other then
            if object:collidingWith(other) then return true end
        end
    end
end
