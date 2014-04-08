require "entity"

Platform = {}
Platform.__index = Platform
setmetatable(Platform, {__index = Entity})

function Platform:new(game)
    local config = config or {}
    local newPlatform = Entity:new(game)  
    
    newPlatform.height = 30
    newPlatform.width = 100 or config.width
    newPlatform.size = config.size or {
        x = 100,
        y = 100
    }

          
    return setmetatable(newPlatform, self)
end

function Platform:update(dt)

end

function Platform:draw()
    self.graphics.rectangle("fill",self.size.x, self.size.y,self.width, self.height)
end