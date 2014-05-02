require 'entity'

Thug = {}
Thug.__index = Thug
setmetatable(Thug, {__index = Entity})

function Thug:new(game, config)
    local thug = Entity:new(game, config)
    thug.type = 'thug'
    thug.gravity = 200
    thug.x = game.window.getWidth() - 60
    thug.y = game.window.getHeight() /5 * 4
    thug.lastPosition = {x, y}
    thug.size = {x = 60, y = 60}
    thug.acceleration = {x = -100, y = 0}
    thug.isJumping = false
    return setmetatable(thug, self)
end

function Thug:update(dt)
    self.lastPosition.x = self.x
    self.lastPosition.y = self.y
    if not self.isJumping then
        self.vel.y = -200
        self.isJumping = true
    end
    self:updatePhysics(dt)
end

function Thug:collide(other, side)
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

end

function Thug:draw(dt)
    self.game.graphics.setColor(128,128,128) --set graphics color
    self.game.graphics.rectangle("fill", self.x, self.y, self.size.x, self.size.y)
    self.game.graphics.setColor(255,255,255) --reset graphics color back to normal
end
