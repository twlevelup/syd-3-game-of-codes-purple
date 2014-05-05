require 'input'
require 'entity'
require 'surface'

Player = Class{__includes={SurfaceTension, Entity},

init = function(self, game, config)
    local config = config or {}
    Entity.init(self, game, config)
    self.type = "player"
    self.alive = true
    self.size = config.size or {
        x = 25,
        y = 98
    }
    self.isJumping = false
    self.jumpSpeed = -600
    self.speed = 500
    self.drag = {x = 10000, y = 0}

    self.x = config.x or
    game.window.getWidth() * 0.1 - (self.size.x/2)
    self.y = config.y or
    game.window.getHeight() * 0.9 - (self.size.y)

    self.graphics = config.graphics or {
        source = "assets/images/alien_sprite.png",
    }

    self.sound = config.sound or {
        moving = {
            source = "assets/sounds/move.wav"
        }
    }

    self.lastPosition = {
        x = nil,
        y = nil
    }

    if game.audio ~= nil then
        self.sound.moving.sample = game.audio.newSource(self.sound.moving.source)
        self.sound.moving.sample:setLooping(true)
    end

    self:newAnimation()
end;

collide = function(self, other, side)
    if other.type == "collectible" then
        return
    end

    if other.type == "rapper collectible" then
        return
    end

    if other.type == 'enemy' then
        self.alive = false
        return
    end

    if other.type == 'item' then
        return
    end

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
            self.x = other.x - self.size.x + self.wind*0.5
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

        self.y = self.lastPosition.y
        self.x = self.lastPosition.x

    end;

    newAnimation = function(self)
        if self.game.graphics ~= nil and self.game.animation ~= nil then
            self.graphics.sprites = self.game.graphics.newImage(self.graphics.source)
            self.graphics.grid = self.game.animation.newGrid(
            self.size.x, self.size.y,
            self.graphics.sprites:getWidth(),
            self.graphics.sprites:getHeight()
            )
            self.animation = self.game.animation.newAnimation(
            self.graphics.grid("1-4", 1),
            0.20
            )
        end
    end;

    update = function (self, dt)

        if self.game.input.pressed('left') then
            self.vel.x = -self.speed

            if self.animation and self.graphics.facing ~= "left" then
                self.animation:flipH()
                self.graphics.facing = "left"
            end
        end

        if self.game.input.pressed('right') then
            self.vel.x = self.speed

            if self.animation and self.graphics.facing ~= "right" then
                self.animation:flipH()
                self.graphics.facing = "right"
            end
        end

        if self.game.input.pressed('jump') then
            if not self.isJumping then
                self.vel.y = self.jumpSpeed
                self.isJumping = true
            end
        end

        if self.game.input.pressed('down') then
            self.vel.y = self.speed
        end

        if self.animation ~= nil then
            if self.vel.x ~= 0 or self.vel.y ~= 0 then
                self.animation:update(dt)
            else
                self.animation:gotoFrame(1)
            end
        end

        Entity.update(self, dt)

        if(self.x < 0) then
            self.x = 0
        end
        if(self.x > self.game.window.getWidth()-self.size.x) then
            self.x =  self.game.window.getWidth()-self.size.x
        end

    end;

    spawn = function(self, object)
        object.x = self.x + self.size.x
        object.y = self.y + (self.size.y/2)
        return object
    end
}
