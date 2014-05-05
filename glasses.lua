require "entity"

Glasses = Class{__includes="Entity",

init = function(self, game)
    local config = config or {}
    Entity.init(self, game, config)
    self.x = 25
    self.y = 0
    self.width = game.window.getWidth()
    self.bar_size = 50
    self.bar_num = game.window.getHeight()
end;

update = function(self, dt)
end;

draw = function(self)
    self.game.graphics.setColor(39,41,44) --set graphics color

    for i = 0, self.bar_size, 2 do 
        self.game.graphics.rectangle("fill", 0, self.x + i*self.bar_size, self.width, self.bar_size)
    end;

    self.game.graphics.setColor(255,255,255) --reset graphics color back to normal
end;

}
