startscreen = {}
function startscreen:enter(prevState)
    self.currentTime = 3
    self.goTime = 2
    self.text = ""
    self.prevState = prevState
end


function startscreen:draw()
  self.prevState:draw()
  local font = love.graphics.newFont(40)
  local fontHeight = font:getHeight()
  local oldFont = love.graphics.getFont()
  love.graphics.setFont(font)
  love.graphics.print(self.text, love.window.getWidth() / 2 - 50, love.window.getHeight() / 2 - fontHeight, 0, 1, 1)
  love.graphics.setFont(oldFont)
end

function startscreen:update(dt)
    self.currentTime = self.currentTime - dt
    if self.currentTime <= 0 then
        self.text = "GO"
        self.goTime = self.goTime - dt
        if self.goTime <= 0 then
            Gamestate.pop()
        end
    else
        self.text = string.format("%d", math.floor(self.currentTime + 0.5))
    end
end
