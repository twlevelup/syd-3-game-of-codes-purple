require 'secret/enemy'

Boss = Class{__includes=Enemy,
file = "assets/images/BigBoss.png",

init = function(self, game, config)
    Enemy.init(self, game, config)
    self.size = {x = 196, y = 500}
    self.x = game.window.getWidth() - self.size.x
    self.y = -self.size.y
    self.alive = true

end;

update = function(self, dt)
    if not self.isJumping then
        self.vel.y = -200
        self.isJumping = true
    end
    Entity.update(self, dt)
end;

collide = function(self, other, side)
    if other.type == "hat" then
        self.alive = false
    end
    Enemy.collide(self, other, side)
end;

spawn = function(self, object) 
    if self.alive then
        return Enemy.spawn(self, object)
    end
end

}
