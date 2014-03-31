require 'globals'
require "entity"

Timer = {}
Timer.__index = Timer
setmetatable(Timer, {__index = Entity})

function Timer:new(game, config)
  local config = config or {}

  local newTimer = Entity:new(game)

  newTimer.game = game
  newTimer._timeLimit = config.timeLimit or 0
  newTimer._timeRemaining = -1
  newTimer._finished = false
  newTimer.size = config.size or {
      x = 50,
      y = 60
  }
  newTimer.x = config.x or 300
  newTimer.y = config.y or 0

  if (config.stageWidth) then
      newTimer.x = config.stageWidth * 0.9 - newTimer.size.x
  end
    if (config.stageHeight) then
      newTimer.y = config.stageHeight * 0.1
   end

  return setmetatable(newTimer, self)
end

function Timer:update(currentTime)
  if(self._finished) then
    return
  end

  if(self._timeRemaining==-1) then
    self._timeRemaining = self._timeLimit
  end
  self._timeRemaining = self._timeRemaining - currentTime

  self._finished = (self:toString() == "00:00" and true or false)
end

function Timer:toString()
  return os.date(GAME_TIME_FORMAT, self._timeRemaining)
end   

function Timer:draw()
  self.game.graphics.rectangle("line", self.x, self.y, 100, 50)
  local fontHeight = self.game.graphics.getFont():getHeight()
  self.game.graphics.printf(self:toString(), self.x, self.size.y+fontHeight, self.size.x, "center", 0, 2, 2)
end

