Class = require 'vendor/class'

require 'pause'
require 'backdrop'
require 'player'
require 'ground'
require 'glasses'

timer = require 'vendor/timer'


stage = {gravity = 1000}

function stage:init()
    self.width = love.window.getWidth()
    self.height = love.window.getHeight()
    self.entities = {}
    self.stageElements = {}
    self.player = self:getPlayer()
    self.ground = Ground(love, {wind = self.wind})
    self.backdrop = self:getBackdrop()
    self.timer = timer.new()
    table.insert(self.stageElements, self.backdrop)
    table.insert(self.entities, self.ground)
    table.insert(self.entities, self.player)

    math.randomseed( os.time() )
end

function stage:getPlayer()
    return Player(love, {gravity = self.gravity, wind = self.wind})
end

function stage:getBackdrop()
    return Backdrop:new(love)
end

function stage:update(dt)
    if self:haswon() then self:finish() end
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
    self.timer:update(dt)
end

function stage:draw()
    --Draw all entities
    for _, e in pairs(self.stageElements) do
        e:draw()
    end

    --Draw all entities
    for _, e in pairs(self.entities) do
        e:draw()
    end

    if self.glasses then self.glasses:draw() end
end

function stage:keyreleased(key)
    if key == love.input.mapping['pause'] then
        self:beforepause()
        Gamestate.push(pause)
    end
    if key == love.input.mapping['kanye'] then
        self:kanye()
    end
end

function stage:kanye()
    if not self.glasses then 
        self.glasses = Glasses(love)
    end
end

function stage:beforepause()
end

function stage:haswon()
end

function stage:finish()
end

function stage:garbage()
    --[[for key, entity in pairs(self.entities) do
        if not (0 <= entity.x <= self.width) then
        end
    end]]--
end
