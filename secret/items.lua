require 'abstract/item'

Gold = Class{__includes=Item, 
file = "assets/images/goldchain.png",

init = function(self, game, config)
    Item.init(self, game, config)
end;

update = function(self, dt)
    Entity.update(self, dt)
end;

collide = function(self, other)
    Item.collide(self, other)
        if other.type == 'ground' or other.type == 'platform' then
            if self.y <= other.y - self.size.y then
                self.vel.y = 0
            end
            if side == 1 or side == 3 then
                if self.lastPosition.y + self.size.y <= other.y then
                    self.y = self.lastPosition.y
                    self.vel.y = 0
                end
                self.x = self.lastPosition.x
            elseif side == 2 then
                self.vel.y = 0
                self.y = self.lastPosition.y
            elseif side == 4 or side == 6 then
                self.x = other.x - self.size.x
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
