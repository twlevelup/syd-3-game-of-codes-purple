require 'input'
require 'entity'

Player = {}
Player.__index = Player
setmetatable(Player, {__index = Entity})

function Player:new(game, config)
    local config = config or {}

    local newPlayer = Entity:new(game, config)
    newPlayer.type = "player"
    newPlayer.size = config.size or {
        x = 54,
        y = 82
    }
    newPlayer.isJumping = false
    newPlayer.jumpSpeed = -600
    newPlayer.speed = 500
    newPlayer.drag = {x = 10000, y = 0}

    newPlayer.x = config.x or
        game.window.getWidth() * 0.1 - (newPlayer.size.x/2)
    newPlayer.y = config.y or
        game.window.getHeight() * 0.9 - (newPlayer.size.y)

    newPlayer.graphics = config.graphics or {
        source = "assets/images/alien-sprites.png",
        facing = "right"
    }

    newPlayer.sound = config.sound or {
        moving = {
            source = "assets/sounds/move.wav"
        }
    }

    newPlayer.lastPosition = {
        x = nil,
        y = nil
    }

    if game.audio ~= nil then
        newPlayer.sound.moving.sample = game.audio.newSource(newPlayer.sound.moving.source)
        newPlayer.sound.moving.sample:setLooping(true)
    end


    if game.graphics ~= nil and game.animation ~= nil then
        newPlayer.graphics.sprites = game.graphics.newImage(newPlayer.graphics.source)
        newPlayer.graphics.grid = game.animation.newGrid(
            newPlayer.size.x, newPlayer.size.y,
            newPlayer.graphics.sprites:getWidth(),
            newPlayer.graphics.sprites:getHeight()
        )
        newPlayer.graphics.animation = game.animation.newAnimation(
            newPlayer.graphics.grid("1-6", 1),
            0.05
        )
    end

    return setmetatable(newPlayer, self)
end

function Player:collide(other)
    if other.type == "collectible" then
        return
    end
    if other.type == "rapper collectible" then
        return
    end
    if self.x == self.lastPosition.x and self.y == self.lastPosition.y then
      self.y = self.y - 1
    else
      self.x = self.lastPosition.x
      self.y = self.lastPosition.y
    end
    self.vel.y = 0
    self.isJumping = false
end

function Player:update(dt)

    if self.game.input.pressed('left') then
        self.vel.x = -self.speed

        if self.graphics.animation and self.graphics.facing ~= "left" then
            self.graphics.animation:flipH()
            self.graphics.facing = "left"
        end
    end

    if self.game.input.pressed('right') then
        self.vel.x = self.speed

        if self.graphics.animation and self.graphics.facing ~= "right" then
            self.graphics.animation:flipH()
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

    self.lastPosition = {
        x = self.x,
        y = self.y
    }

    if self.graphics.animation ~= nil then
        if self.vel.x ~= 0 or self.vel.y ~= 0 then
            self.graphics.animation:update(dt)
        else
            self.graphics.animation:gotoFrame(1)
        end
    end

    self:updatePhysics(dt)

    if(self.x < 0) then
      self.x = 0
    end
    if(self.x > self.game.window.getWidth()-self.size.x) then
      self.x =  self.game.window.getWidth()-self.size.x
    end

end
