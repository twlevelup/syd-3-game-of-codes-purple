require 'goldchain'

AgeChain = Class{__includes=GoldChain,
file = "assets/images/goldchain.png",

init = function(self, game, config)
    GoldChain.init(self, game, config)
    self.age = 0
    self.maxAge = 3
end;

update = function(self, dt)
    Item.update(self, dt)
    self.age = self.age + dt
end;

draw = function(self)
    if self:expired() then return end
    Item.draw(self)
end;

expired = function(self)
    return (self.age >= self.maxAge)
end
}
