require 'abstract/stage'
require 'secret/enemy'
require 'secret/items'
require 'secret/dash'
require 'secret/easter'
require 'secret/caption'
require 'platform'

windy = {}
windy.__index = windy
setmetatable(windy, {__index = stage})

windyMusic = love.audio.newSource("assets/songs/backing.ogg")

function windy:init()
    stage.init(self)
    windyMusic:play()
    windyMusic:setLooping(true)
end

function windy:enter()
    self:reset()
end

function windy:reset()
    self.wind = 0
    self.entities = {}
    self.stageElements = {}
    stage.init(self)
    self.item = nil
    self.timer:clear()
    self.timer:addPeriodic(1, function()
        thug = Thug(love, {drop=true})
        table.insert(self.entities, thug)
    end)
    self.counter = Counter(love, {count = 0, interval = 111, maxcount = 666, counttext="?"})
    table.insert(self.stageElements, self.counter)
    self.glasses = nil
end

function windy:update(dt)
    self:dropitem()
    stage.update(self,dt)
end

function windy:dropitem()
    chain = Gold(love)
    if not self.item or self.item.collected then
        if self.item and self.item.collected then self.counter:increase() end
        if self.item then self.item:destroy() end
        self.item = chain
        self.item.x = math.random(self.item.size.x, self.width-self.item.size.x)
        self.item.y = math.random(self.height*0.5, self.height*0.8)
        table.insert(self.entities, self.item)
    end
end

function windy:kanye()
    if self.counter.maxcount == self.counter.count then
        stage.kanye(self)
    else
        self.counter:reset()
    end
end

function windy:haswon()
    if not self.player.alive then
        Gamestate.switch(windy)
    end
    return  (self.counter._allCollected)
end

function windy:finish()
    if self.counter._allCollected and self.glasses then
        Gamestate.switch(caption, dash, "Quick!", 0.8)
    end
end
