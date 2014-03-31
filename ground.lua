require 'entity'

Ground = {}
Ground.__index = Ground
setmetatable(Ground, {__index = Entity})

function Ground:new(game)
  local newGround = {
    x = 0,
    y = 0.9 * game.window.getHeight(),
    graphics = love.graphics,
    size = {
      x = game.window.getWidth(),
      y = 0
    }
  }

  return setmetatable(newGround, self)
end

function Ground:draw()
  self.graphics.line(self.x, self.y, self.x + self.size.x, self.y + self.size.y)
  self.graphics.circle("fill", 300, self.y, 3, 100) 
end

function Ground:update(dt)
end

