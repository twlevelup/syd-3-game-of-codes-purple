require 'entity'

Ground = {}
Ground.__index = Ground

function Ground:new()
  local newGround = {
    graphics = love.graphics
  }

  return setmetatable(newGround, self)
end

function Ground:draw()
  self.graphics.line(1, 1, 20, 20)
end
