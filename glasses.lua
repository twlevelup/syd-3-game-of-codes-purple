require "entity"

Glasses = {}
Glasses.__index = Glasses
setmetatable(Glasses, {__index = Entity})

function Glasses:new(game)
    local config = config or {}
    local newGlasses = Entity:new(game, config)
    newGlasses.x = 25
    newGlasses.y = 0
    newGlasses.width = game.window.getWidth()
    newGlasses.bar_size = 50
    newGlasses.bar_num = game.window.getHeight()
    return setmetatable(newGlasses, self)
end

function Glasses:update(dt)
end

function Glasses:draw()
    self.game.graphics.setColor(39,41,44) --set graphics color

    for i = 0, self.bar_size, 2 do 
        self.game.graphics.rectangle("fill", 0, self.x + i*self.bar_size, self.width, self.bar_size)
    end

    self.game.graphics.setColor(255,255,255) --reset graphics color back to normal
end
