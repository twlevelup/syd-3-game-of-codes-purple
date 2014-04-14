stageTransition = {}

function stageTransition:draw()
  -- local text = "Paused.\nPress '" .. love.input.mapping['pause'] .. "' to continue"
  local text = "TIME IS UP"
  
  love.graphics.setFont(love.graphics.newFont(40))

  love.graphics.printf(text, 0, love.window.getHeight() / 2 - 20, 800, 'center')

  

  --love.graphics.print("RESET (Z)", love.window.getWidth() / 2, love.window.getHeight() / 10)
  

  love.graphics.setBackgroundColor(255,0,0)
end

function stageTransition:update(dt)
end
