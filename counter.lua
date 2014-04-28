require "entity"
require 'stageTransition'

Gamestate = require "vendor/gamestate"

Counter = {}
Counter.__index = Counter
setmetatable(Counter, {__index = Entity})

function Counter:new(game, config)
    local config = config or {}

    local newCounter = Entity:new(game)
    newCounter.count = config.count or 0
    newCounter.interval = config.interval or 1
    newCounter.maxcount = config.maxcount or 10
    newCounter._allCollected = false
    newCounter.size = config.size or {
        x = 50,
        y = 60
    }
    newCounter.x = config.x or 0 + newCounter.size.x
    newCounter.y = config.y or game.window.getHeight() * 0.1

    return setmetatable(newCounter, self)
end

function Counter:update(dt)
    if(self._allCollected) then
        Gamestate.push(stageTransition)
        return
    end

    self._allCollected = (self.count == self.maxcount and true or false)
end

function Counter:toString()
    return self.count .. " / " .. self.maxcount
end

function Counter:increaseTen()
    self.count = self.count + self.interval
    return
end

function Counter:decreaseTen()
    self.count = self.count - self.interval
    return
end

function Counter:draw()
    self.game.graphics.rectangle("line", self.x, self.y, 100, 50)
    local fontHeight = self.game.graphics.getFont():getHeight()
    self.game.graphics.printf(self:toString(), self.x, self.size.y+fontHeight, self.size.x, "center", 0, 2, 2)
end
