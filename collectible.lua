require "entity"

Collectible = {}
Collectible.__index = Collectible
setmetatable(Collectible, {__index = Entity})

function Collectible:new(game, config)
    local config = config or {}
    local newCollectible = Entity:new(game, config)
    newCollectible.type = "collectible"
    newCollectible.x = config.x or game.window.getWidth() / 2
    newCollectible.y = config.y or game.window.getHeight() * 2 / 3
    newCollectible.name = config.name or "GoldChain"
    newCollectible.size = config.size or {
        x = 23,
        y = 29
    }

    return setmetatable(newGoldChainRapper, self)
end

function Collectible:update(dt)
    self:updatePhysics(dt)
end

function Collectible:draw()
    if (self.name=="GoldChain") then
    collectibleImg = love.graphics.newImage("assets/images/goldchain.png")
    end
    if (self.name=="GoldChainRapper") then
    collectibleImg = love.graphics.newImage("assets/images/goldchainrapper.png")
    end

    love.graphics.draw(collectibleImg, self.x, self.y)
end
