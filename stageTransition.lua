stageTransition = {}

function stageTransition:draw()
  kanyeImg = love.graphics.newImage("assets/images/BigBossKanye.png")
  love.graphics.draw(kanyeImg, 50, 40)

  -- local text = "Paused.\nPress '" .. love.input.mapping['pause'] .. "' to continue"
  local text = "TIME IS UP YO"
  
  love.graphics.setFont(love.graphics.newFont(40))

  love.graphics.printf(text, 0, love.window.getHeight() / 2 - 20, 1200, 'center')

  

  --love.graphics.print("RESET (Z)", love.window.getWidth() / 2, love.window.getHeight() / 10)
  

  love.graphics.setBackgroundColor(255,0,0)
end

function stageTransition:update(dt)
end
