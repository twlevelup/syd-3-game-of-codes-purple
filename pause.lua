pause = {}

function pause:draw()
  love.graphics.print("Paused. Press '" .. love.input.mapping['pause'] .. "' to continue", 10, 10)
end

function pause:update(dt)
end

function pause:keyreleased(key)
  if key == love.input.mapping['pause'] then
    Gamestate.pop()
  end
end

