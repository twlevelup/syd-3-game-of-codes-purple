require 'entity'

Egg = Class{__includes={Entity},
file = nil,
left = true,

init = function(self, game, config)
    local config = config or {}
    Entity.init(self, game, config)
    self.type = 'easter'
    self.time = 0
    self.speed = 2
    self.amp = 50
    self.y = config.y or 100
    if self.left then
        self.x = config.x or -200
    else
        self.x = game.window.getWidth() + 100
    end
    if self.file then self.image = game.graphics.newImage(self.file) end
    self.size = {x = 150, y = 120}
end;

update = function(self, dt)
    self.time = self.time + dt
    self.x = self.game.window.getWidth()*(self.time/self.speed)
    self.y = 50 + -self.amp * math.sin(2*math.pi*self.time)
end;
draw = function(self)
    self.game.graphics.draw(self.image, self.x, self.y)
end
}

SpaceEgg = Class{__includes={Egg}, file = "assets/images/SpaceCowboy.png"}
CowEgg = Class{__includes={Egg}, file = "assets/images/GreenCow.png"}
