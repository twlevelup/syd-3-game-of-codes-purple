require 'entity'

Enemy = Class{__includes={Entity},
    file = nil,

init = function(self, game, config)
    local config = config or {}
    Entity.init(self, game, config)
    self.type = 'enemy'
    self.gravity = config.gravity or math.random(150, 250)
    self.x = config.x or game.window.getWidth()
    self.y = config.y or game.window.getHeight() /5 * 4
    self.lastPosition = {x, y}
    self.size = {x = 60, y = 60}
    self.speed = config.speed or 300
    self.acceleration = {x = -100, y = 0}
    self.isJumping = config.drop or false
    self.alive = true
    if self.file then self.image = game.graphics.newImage(self.file) end
end;

update = function(self, dt)
    if not self.alive then return end
    if not self.isJumping then
        self.vel.y = -200
        self.vel.x = -math.random(150, self.speed)
        self.isJumping = true
    end
    Entity.update(self, dt)
end;

collide = function(self, other, side)
    if other.type == 'ground' or other.type == 'platform' then
        if self.y <= other.y - self.size.y then
            self.isJumping = false
            self.vel.y = 0
        end
        if side == 1 or side == 3 then
            if self.lastPosition.y + self.size.y <= other.y then
                self.y = self.lastPosition.y
                self.isJumping = false
                self.vel.y = 0
            end
            self.x = self.lastPosition.x
        elseif side == 2 then
            self.isJumping = false
            self.vel.y = 0
            self.y = self.lastPosition.y
        elseif side == 4 or side == 6 then
            self.x = self.lastPosition.x
        elseif side == 7 or side == 9 then
            if self.lastPosition.y >= other.y + other.size.y then
                self.y = self.lastPosition.y
                self.vel.y = 0
            end
            self.x = self.lastPosition.x
        elseif side == 8 then
            self.y = self.lastPosition.y
        end
        return
    end
end;

spawn = function(self, object)
    if self.alive then
        object.x = self.x
        object.y = self.y + (self.size.y / 2)
        return object
    end
end;

draw = function(self)
    if self.alive then Entity.draw(self) end
end
}

Thug = Class{__includes=Enemy, file = "assets/images/goldchainrapper.png"}
