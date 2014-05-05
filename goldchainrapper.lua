require "entity"
--Assume will have different behavior from GoldChain

GoldChainRapper = Class{__includes=Entity,

init = function(self, game, config)
    local config = config or {}
    Entity.init(self, game, config)
    self.type = "collectible"
    self.x = config.x or game.window.getWidth() / 2
    self.y = config.y or game.window.getHeight() * 2 / 3
    self.size = config.size or {
        x = 23,
        y = 29
    }
    self.isCollected = false

end;

update = function(self, dt)
    self:updatePhysics(dt)
end;

draw = function(self)
    if (not self.isCollected) then
    goldChainRapperImg = love.graphics.newImage("assets/images/goldchainrapper.png")
    love.graphics.draw(goldChainRapperImg, self.x, self.y)
    end
end;

collide = function(self, other)
    if other.type == "player" then
        if (not self.isCollected) then
        --self.graphics 
        --collectgarbage("collect")
        self.isCollected = true
        game.counter:increaseTen()
        end
    end
end;

}
