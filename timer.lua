require 'globals'
require "entity"

Timer = {}
Timer.__index = Timer
setmetatable(Timer, {__index = Entity})

function Timer:new(game, config)
    local config = config or {}

    local newTimer = Entity:new(game)
    newTimer._timeLimit = config.timeLimit or 0
    newTimer._timeRemaining = -1
    newTimer._finished = false
    newTimer.size = config.size or {
        x = 50,
        y = 60
    }
    newTimer.x = config.x or game.window.getWidth() * 0.9 - newTimer.size.x
    newTimer.y = config.y or game.window.getHeight() * 0.1

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

    self._finished = (self:toString() == "0:00" and true or false)
end

function Timer:toString()
    return string.sub(os.date(GAME_TIME_FORMAT, self._timeRemaining), 2)
end   

function Timer:draw()
    self.game.graphics.rectangle("line", self.x, self.y, 100, 50)
    local fontHeight = self.game.graphics.getFont():getHeight()
    self.game.graphics.printf(self:toString(), self.x, self.size.y+fontHeight, self.size.x, "center", 0, 2, 2)
end

