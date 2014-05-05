require 'abstract/collision'
require 'abstract/physics'


Entity = Class { __includes = {Collision, Physics},

    init = function(self, game, config)
        local config = config or {}
        self.type = "entity"
        self.game = game
        self.x = 0
        self.y = 0
        self.size = {x = 0, y = 0}
        self.lastPosition = {x, y}
        self.vel = config.vel or {x = 0, y = 0}
        self.minVel = config.minVel or {x = -math.huge, y = -math.huge}
        self.maxVel = config.maxVel or {x = math.huge, y = math.huge}
        self.gravity = config.gravity or 0
        self.wind = config.wind or 0
        self.acc = config.acc or {x = 0, y = 0}
        self.drag = config.drag or {x = 0, y = 0}
    end;

    update = function(self, dt)
        self.lastPosition.x = self.x
        self.lastPosition.y = self.y
        self:updatePhysics(dt)
    end;

    draw = function(self)
        if self.image then
            self.game.graphics.draw(self.image, self.x, self.y)
        elseif self.animation then
            self.animation:draw(self.graphics.sprites, self.x, self.y)
        else
            self.game.graphics.rectangle("fill", self.x, self.y, self.size.x, self.size.y)
        end
        if DEBUG_MODE then
            self.game.graphics.rectangle("line", self.x, self.y, self.size.x, self.size.y)
        end
    end;

    destroy = function(self)
        self.x = self.x - 10000
        self.y = self.y - 10000
        self = nil
    end
}
