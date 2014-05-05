Class = require 'vendor/class'

Physics = Class {

    updatePhysics = function(self, dt)
        self.x = calculateNewCoordinateFromVelocity(self.x, self.vel.x, dt)
        if self.vel.x == 0 and self.wind ~= 0 then
            self.x = calculateNewCoordinateFromVelocity(self.x, self.wind, dt)
        end
        self.y = calculateNewCoordinateFromVelocity(self.y, self.vel.y, dt)
        self.vel.x = calculateVelocity(dt, self.vel.x, self.acc.x, self.drag.x)
        self.vel.y = calculateVelocity(dt, self.vel.y, self.acc.y, self.drag.y)
        if self.gravity ~= 0 then
            self.vel.y = calculateVelocity(dt, self.vel.y, self.gravity, _)
        end
        self.vel.x = getConstrainedPoint(self.vel.x, self.minVel.x, self.maxVel.x)
        self.vel.y = getConstrainedPoint(self.vel.y, self.minVel.y, self.maxVel.y)
    end;
}

calculateNewCoordinateFromVelocity = function(coordinate, velocity, dt)
        return (velocity ~= 0 and coordinate + velocity * dt or coordinate)
    end

    calculateVelocity = function(dt, currentVel, acceleration, drag)
        local velocity = currentVel
        if acceleration and acceleration ~= 0 then
            velocity = currentVel + acceleration * dt
        else
            if drag and drag ~= 0 then
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

    getConstrainedPoint = function(value, min, max)
        if value > max then value = max end
        if value < min then value = min end
        return value
    end

