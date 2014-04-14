pause = {}

function pause:draw()
  -- local text = "Paused.\nPress '" .. love.input.mapping['pause'] .. "' to continue"
  local text = "Paused."
  love.graphics.print(text, love.window.getWidth() / 2, love.window.getHeight() / 2)
end

function pause:update(dt)
end

function pause:keyreleased(key)
  if key == love.input.mapping['pause'] then
    Gamestate.pop()
  end
end

