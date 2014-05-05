caption = {}

function caption:enter(prevState, nextState, text, time)
  self.prevState = prevState
  self.text = text
  self.time = time
  self.current = 0
  self.forward = nextState
end

function caption:draw()
  local oldFont = love.graphics.getFont()
  local font = love.graphics.newFont(40)
  local fontHeight = font:getHeight()
  love.graphics.setFont(font)
  love.graphics.print(self.text, 50, love.window.getHeight() / 2 - fontHeight, 0, 1, 1)
  love.graphics.setFont(oldFont)
end

function caption:update(dt)
    self.current = self.current + dt
    if self.current > self.time then
        Gamestate.switch(self.forward)
    end
end

