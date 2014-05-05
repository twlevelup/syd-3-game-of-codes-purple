require 'entity'


Ground = Class{__includes={Entity},

init = function(self, game, config)
    local config = config or {}
    Entity.init(self, game, config)
    self.type = "ground"
    self.path = config.path or "assets/images/skyline-ground.png"
    self.image_size = config.image_size or {
        x = 45,
        y = 200
    }
    self.x = 0
    self.y = 0.9 * game.window.getHeight()
    self.size = {
        x = game.window.getWidth() + self.image_size.x,
        y = 200
    }
end;

getImage = function(self)
    if not self.image then
        self.image = self.game.graphics.newImage(self.path)
        self.image:setWrap("repeat", "clamp")
    end

    return self.image
end;

getQuad = function(self)
    if not self.quad then
        self.quad = self.game.graphics.newQuad(0, 0, self.size.x, self.size.y, self.image_size.x, self.image_size.y)
    end

    return self.quad
end;

draw = function(self)
    self.game.graphics.draw(self:getImage(), self:getQuad(), self.x, self.y)
end;

update = function(self, dt)
    self:updatePhysics(dt)
    if self.x < -self.image_size.x then
        self.x = self.x + self.image_size.x
    end
end
}
