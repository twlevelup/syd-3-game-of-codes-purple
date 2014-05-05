require 'globals'
require "entity"
require 'stageTransition'

Clock = Class{__includes={Entity},

init = function(self, game, config)
    local config = config or {}
    Entity.init(self, game, config)
    self._timeLimit = config.timeLimit or 0
    self._timeRemaining = -1
    self._finished = false
    self.size = config.size or {
        x = 50,
        y = 60
    }
    self.x = config.x or game.window.getWidth() * 0.9 - self.size.x
    self.y = config.y or game.window.getHeight() * 0.1
end;

update = function(self, dt)
    if(self._timeRemaining==-1) then
        self._timeRemaining = self._timeLimit
    end
    self._timeRemaining = self._timeRemaining - dt

    self._finished = (self._timeRemaining <= 0)
end;

toString = function(self)
    local output = (self._timeRemaining == -1) and self._timeLimit or self._timeRemaining
    return string.sub(os.date(GAME_TIME_FORMAT, output), 2)
end;

draw = function(self)
    self.game.graphics.rectangle("line", self.x, self.y, 100, 50)
    local fontHeight = self.game.graphics.getFont():getHeight()
    self.game.graphics.printf(self:toString(), self.x, self.size.y+fontHeight, self.size.x, "center", 0, 2, 2)
end;
}

