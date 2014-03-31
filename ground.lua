require 'entity'

Ground = {}
Ground.__index = Ground

function Ground:new(game)
  local newGround = {
    x = 0,
    y = 0.9 * game.y,
    graphics = love.graphics
  }

  return setmetatable(newGround, self)
end

function Ground:draw()
  self.graphics.line(self.x, self.y, 20, 20)
end

function Ground:update(dt)
end

