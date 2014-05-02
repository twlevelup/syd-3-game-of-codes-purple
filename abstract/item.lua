require 'entity'

Item = {picture=nil}
Item.__index = Item

function Item:init(game, config)
    local config = config or {}
    self.game = game
    self.type = 'item'
    self.size = {x = 30, y = 30}
    self.x = config.x or 350
    self.y = config.y or 200
    self.image = game.graphics.newImage(self.picture)
    self.collected = false
end

function Item:draw()
    if self.collected then return end
    self.game.graphics.draw(self.image, self.x, self.y)
end

function Item:collide(other, side)
    if other.type == 'player' then
        self.collected = true
    end
end

function Item:update(dt)
    self:updatePhysics(dt)
end

function Item:reset()
    item.collected = false
end


