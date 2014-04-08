Entity = {}
Entity.__index = Entity

function Entity:new(game)
    local newEntity = {
        game = game,
        x = 0,
        y = 0,
        vel = {x = 0, y = 0},
        minVel = {x = -math.huge, y = -math.huge},
        maxVel = {x = math.huge, y = math.huge},
        acc = {x = 0, y = 200},
        drag = {x = 50, y = 0}
    }

    return setmetatable(newEntity, self)
end

function Entity:draw()
    if self.graphics.animation then
      self.graphics.animation:draw(self.graphics.sprites, self.x, self.y)
    else
      self.game.graphics.rectangle("fill", self.x, self.y, self.size.x, self.size.y)
    end
    if DEBUG_MODE then
        self.game.graphics.rectangle("line", self.x, self.y, self.size.x, self.size.y)
    end
end

function Entity:bounds()
    return {
        top = self.y,
        left = self.x,
        bottom = self.y + self.size.y,
        right = self.x + self.size.x
    }
end

function Entity:collidingWith(other)
    local bounds = self:bounds()
    local other = other:bounds()

    local my_left_overlaps_their_right = bounds.left <= other.right and bounds.right >= other.right
    local my_right_overlaps_their_left = bounds.right >= other.left and bounds.left <= other.left

    local my_top_overlaps_their_bottom = bounds.top <= other.bottom and bounds.bottom >= other.bottom
    local my_bottom_overlaps_their_top = bounds.bottom >= other.top and bounds.top <= other.top

    return (my_left_overlaps_their_right or my_right_overlaps_their_left) and
            (my_top_overlaps_their_bottom or my_bottom_overlaps_their_top)
end

function Entity:collide(other)
end

function Entity:updatePhysics(dt)
    self.x = calculateNewCoordinateFromVelocity(self.x, self.vel.x, dt)
    self.y = calculateNewCoordinateFromVelocity(self.y, self.vel.y, dt)
    self.vel.x = calculateVelocity(dt, self.vel.x, self.acc.x, self.drag.x, self.minVel.x, self.maxVel.x)
    self.vel.y = calculateVelocity(dt, self.vel.y, self.acc.y, self.drag.y, self.minVel.y, self.maxVel.y)
    if self.vel.y > self.maxVel.y then self.vel.y = self.maxVel.y end
    if self.vel.y < self.minVel.y then self.vel.y = self.minVel.y end
end

function calculateNewCoordinateFromVelocity(coordinate, velocity, dt)
    return (velocity ~= 0 and coordinate + velocity * dt or coordinate)
end

function calculateVelocity(dt, currentVel, acceleration, drag)
    local velocity = 0
    if acceleration and acceleration ~= 0 then
        velocity = currentVel + acceleration * dt
    else
        if drag then
            if currentVel > 0 then
                velocity = currentVel - drag * dt
                if velocity < 0 then velocity = 0 end
            elseif currentVel < 0 then
                velocity = currentVel + drag * dt
                if velocity > 0 then velocity = 0 end
            end
        end
    end
    return velocity
end

function getConstrainedPoint(value, min, max)
    if value > max then value = max end
    if value < min then value = min end
    return value
end
