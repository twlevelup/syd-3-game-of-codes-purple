require "entity"

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
        x = 30,
        y = 65
    }

    return setmetatable(newGoldChainRapper, self)
end

function GoldChainRapper:update(dt)
    self:updatePhysics(dt)
end

function GoldChainRapper:draw()
    goldChainRapperImg = love.graphics.newImage("assets/images/goldchainrapper.png")
    love.graphics.draw(goldChainRapperImg, self.x, self.y)
end
