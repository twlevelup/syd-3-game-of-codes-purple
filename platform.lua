require "entity"

Platform = Class{__includes=Entity,
init = function(self, game, config)
    local config = config or {}
    Entity.init(self, game, config)
    self.type = "platform"
    self.x = config.x or game.window.getWidth() / 2
    self.y = config.y or game.window.getHeight() * 2 / 3
    self.size = config.size or {
        x = 120,
        y = 25
    }
end;

update = function(self, dt)
    self:updatePhysics(dt)
end;

draw = function(self)
    self.game.graphics.setColor(128,128,128) --set graphics color
    self.game.graphics.rectangle("fill", self.x, self.y, self.size.x, self.size.y)
    self.game.graphics.setColor(255,255,255) --reset graphics color back to normal
end
}
