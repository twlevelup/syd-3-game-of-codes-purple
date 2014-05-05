Class = require 'vendor/class'

SurfaceTension = Class{

    collide = function(self, other, result)
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

    end

}
