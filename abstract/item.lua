require 'entity'

Item = Class{__includes={Entity},
file = nil,

init = function(self, game, config)
    local config = config or {}
    Entity.init(self, game, config)
    self.type = 'item'
    self.size = config.size or {x = 30, y = 30}
    self.x = config.x or game.window.getWidth() / 2
    self.y = config.y or game.window.getHeight() * 2 / 3
    if self.file then self.image = game.graphics.newImage(self.file) end
    self.collected = false
end;

draw = function(self)
    if self.collected then return end
    Entity.draw(self)
end;

collide =  function(self, other)
    if other.type == 'player' and not self.collected then
        self.collected = true
    end
end;

reset = function(self)
    self.collected = false
end
}

