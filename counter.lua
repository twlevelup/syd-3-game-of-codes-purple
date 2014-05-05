require "entity"

Counter = Class{

init = function(self, game, config)
    local config = config or {}

    Entity.init(self, game, config)
    self.count = config.count or 0
    self.interval = config.interval or 1
    self.maxcount = config.maxcount or 10
    self.counttext = config.counttext
    self._allCollected = false
    self.size = config.size or {
        x = 50,
        y = 60
    }
    self.x = config.x or 0 + self.size.x
    self.y = config.y or game.window.getHeight() * 0.1
end;

update = function(self, dt)
    self._allCollected = (self.count >= self.maxcount)
end;

toString = function(self)
    return self.count .. " / " .. (self.counttext or self.maxcount)
end;

increase = function(self)
    self.count = self.count + self.interval
    return
end;

decrease = function(self)
    self.count = self.count - self.interval
    return
end;

reset = function(self)
    self.count = 0
end;

draw = function(self)
    self.game.graphics.rectangle("line", self.x, self.y, 100, 50)
    local fontHeight = self.game.graphics.getFont():getHeight()
    self.game.graphics.printf(self:toString(), self.x, self.size.y+fontHeight, self.size.x, "center", 0, 2, 2)
end
}
