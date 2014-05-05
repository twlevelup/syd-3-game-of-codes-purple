require 'abstract/stage'
require 'stageTransition'
require 'wonState'
require 'secret/enemy'
require 'secret/items'
require 'secret/easter'
require 'secret/bigplayer'
require 'secret/boss'
require 'secret/caption'
require 'platform'

finale = {}
finale.__index = finale
setmetatable(finale, {__index = stage})

function finale:enter()
    self:reset()
end

function finale:reset()
    self.wind = 0
    self.entities = {}
    self.stageElements = {}
    stage.init(self)
    self.item = nil
    self.timer:clear()
    self.boss = Boss(love)
    table.insert(self.entities, self.boss)
    self.timer:addPeriodic(1.25, function()
        local result = math.random(0, 100)
        local throwable = self.boss:spawn(Thug(love, {gravity = 350, drop=true, speed = 500}))
        table.insert(self.entities, throwable)
    end)
    self.timer:addPeriodic(1.6, function()
        local result = math.random(0, 100)
        local throwable = nil

        if result > 90 then
            --Cows
        elseif result > 70 then
            --Gold
            throwable = self.boss:spawn(Gold(love, {wind = -200}))
            self.item = throwable
        end
        table.insert(self.entities, throwable)
    end)
        self.counter = Counter(love, {count = 0, interval = 1, maxcount = 5})
        table.insert(self.stageElements, self.counter)
    self.glasses = nil
end

function finale:getPlayer()
    return BigPlayer(love, {gravity = self.gravity, wind = self.wind})
end

function finale:update(dt)
    stage.update(self,dt)
    self:thrown()
end

function finale:thrown()
    if self.item and self.item.collected then
        self.counter:increase()
        self.item:destroy()
        self.item = nil
    end
end

function finale:ultimate()
    if self.counter._allCollected and self.player.hat then
        self.player:loseHat()
        table.insert(self.entities, self.player:spawn(Hat(love)))
    end
end

function finale:kanye()
    self:ultimate()
end

function finale:haswon()
    return (not self.player.alive or not self.boss.alive)
end

function finale:finish()
    if not self.player.alive then
        Gamestate.switch(finale)
    end
    if not self.boss.alive then
        Gamestate.switch(caption, wonState, "Congulations!\nYou defeated the horror of\nKanyepocalypse", 2)
    end
end
