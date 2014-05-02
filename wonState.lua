wonState = {}

function wonState:draw()
  kanyeImg = love.graphics.newImage("assets/images/alien.png")
  love.graphics.draw(kanyeImg, 50, 40)

  -- local text = "Paused.\nPress '" .. love.input.mapping['pause'] .. "' to continue"
  local text = "You have won Yo!"
  
  love.graphics.setFont(love.graphics.newFont(40))

  love.graphics.printf(text, 0, love.window.getHeight() / 2 - 20, 1200, 'center')

  

  --love.graphics.print("RESET (Z)", love.window.getWidth() / 2, love.window.getHeight() / 10)
  

  love.graphics.setBackgroundColor(255,0,0)
end

function wonState:update(dt)
end
