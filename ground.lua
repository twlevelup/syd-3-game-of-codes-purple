require 'entity'

Ground = {}
Ground.__index = Ground
setmetatable(Ground, {__index = Entity})

function Ground:new(game)
    local ground = Entity:new(game)
    ground.x = 0
    ground.y = 0.9 * game.window.getHeight()
    ground.size = {
            x = game.window.getWidth(),
            y = 200
    }
    ground.graphics = {
        source = "assets/images/skyline-ground.png"
    }

    if game.graphics ~= nil then
        ground.graphics.image = game.graphics.newImage(ground.graphics.source)
        ground.graphics.image:setWrap("repeat", "clamp")
        ground.graphics.quad = game.graphics.newQuad(0, 0, ground.size.x, ground.size.y, 45, 200)
    end
    return setmetatable(ground, self)
end

function Ground:draw()
-- self.game.graphics.line(self.x, self.y, self.x + self.size.x, self.y + self.size.y)
-- self.game.graphics.circle("fill", 300, self.y, 3, 100)
    self.game.graphics.draw(self.graphics.image, self.graphics.quad, self.x, self.y)
end

function Ground:update(dt)
end

