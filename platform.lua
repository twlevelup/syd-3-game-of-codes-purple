require "entity"

Platform = {}
Platform.__index = Platform
setmetatable(Platform, {__index = Entity})

function Platform:new(game, config)
    local config = config or {}
    local newPlatform = Entity:new(game, config)
    newPlatform.type = "platform"
    newPlatform.x = config.x or game.window.getWidth() / 2
    newPlatform.y = config.y or game.window.getHeight() * 2 / 3
    newPlatform.size = config.size or {
        x = 120,
        y = 25
    }

    return setmetatable(newPlatform, self)
end

function Platform:update(dt)
    self:updatePhysics(dt)
end

function Platform:draw()
    love.graphics.setColor(128,128,128) --set graphics color
    self.game.graphics.rectangle("fill", self.x, self.y, self.size.x, self.size.y)
    love.graphics.setColor(255,255,255) --reset graphics color back to normal
end
