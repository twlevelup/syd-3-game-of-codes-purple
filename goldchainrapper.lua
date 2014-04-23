require "entity"
--Assume will have different behavior from GoldChain

GoldChainRapper = {}
GoldChainRapper.__index = GoldChainRapper
setmetatable(GoldChainRapper, {__index = Entity})

function GoldChainRapper:new(game, config)
    local config = config or {}
    local newGoldChainRapper = Entity:new(game, config)
    newGoldChainRapper.type = "collectible"
    newGoldChainRapper.x = config.x or game.window.getWidth() / 2
    newGoldChainRapper.y = config.y or game.window.getHeight() * 2 / 3
    newGoldChainRapper.size = config.size or {
        x = 23,
        y = 29
    }
    newGoldChainRapper.isCollected = false

    return setmetatable(newGoldChainRapper, self)
end

function GoldChainRapper:update(dt)
    self:updatePhysics(dt)
end

function GoldChainRapper:draw()
    if (not self.isCollected) then
    goldChainRapperImg = love.graphics.newImage("assets/images/goldchainrapper.png")
    love.graphics.draw(goldChainRapperImg, self.x, self.y)
    end
end

function GoldChainRapper:collide(other)
    if other.type == "player" then
        if (not self.isCollected) then
        --self.graphics 
        --collectgarbage("collect")
        self.isCollected = true
        game.counter:increaseTen()
        end
    end
end
