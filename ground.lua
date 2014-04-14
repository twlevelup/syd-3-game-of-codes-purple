require 'entity'

Ground = {}
Ground.__index = Ground
setmetatable(Ground, {__index = Entity})

function Ground:new(game, config)
    local config = config or {}
    local ground = Entity:new(game, config)
    ground.path = config.path or "assets/images/skyline-ground.png"
    ground.image_size = config.image_size or {
      x = 45,
      y = 200
    }
    ground.x = 0
    ground.y = 0.9 * game.window.getHeight()
    ground.size = {
            x = game.window.getWidth() + ground.image_size.x,
            y = 200
    }

    return setmetatable(ground, self)
end

function Ground:getImage()
  if not self.image then
    self.image = self.game.graphics.newImage(self.path)
    self.image:setWrap("repeat", "clamp")
  end

  return self.image
end

function Ground:getQuad()
  if not self.quad then
    self.quad = self.game.graphics.newQuad(0, 0, self.size.x, self.size.y, self.image_size.x, self.image_size.y)
  end

  return self.quad
end

function Ground:draw()
    self.game.graphics.draw(self:getImage(), self:getQuad(), self.x, self.y)
end

function Ground:update(dt)
    self:updatePhysics(dt)
    if self.x < -self.image_size.x then
        self.x = self.x + self.image_size.x
    end
end
