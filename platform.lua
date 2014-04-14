require "entity"

Platform = {}
Platform.__index = Platform
setmetatable(Platform, {__index = Entity})

function Platform:new(game, config)
    local config = config or {}
    local newPlatform = Entity:new(game, config)
    newPlatform.x = game.window.getWidth()
    newPlatform.y = game.window.getHeight() * 2 / 3
    newPlatform.size = config.size or {
        x = 200,
        y = 25
    }

    return setmetatable(newPlatform, self)
end

function Platform:update(dt)
    self:updatePhysics(dt)
end

function Platform:draw()
    self.game.graphics.rectangle("line", self.x, self.y, self.size.x, self.size.y)
end
