pause = {}

function pause:enter(prevState)
  self.prevState = prevState
end

function pause:draw()
  -- local text = "Paused.\nPress '" .. love.input.mapping['pause'] .. "' to continue"

  self.prevState:draw()
  local text = "PAUSED"

  local oldFont = love.graphics.getFont()
  local font = love.graphics.newFont(40)
  local fontHeight = font:getHeight()
  love.graphics.setFont(font)
  love.graphics.print(text, love.window.getWidth() / 2 - 50, love.window.getHeight() / 2 - fontHeight, 0, 1, 1)
  love.graphics.setFont(oldFont)
end

function pause:update(dt)
end

function pause:keyreleased(key)
  if key == love.input.mapping['pause'] then
    Gamestate.pop()
  end
end

