require "entity"

GoldChain = {}
GoldChain.__index = GoldChain
setmetatable(GoldChain, {__index = Entity})

function GoldChain:new(game, config)
    local config = config or {}
    local newGoldChain = Entity:new(game, config)
    newGoldChain.type = "collectible"
    newGoldChain.x = config.x or game.window.getWidth() / 2
    newGoldChain.y = config.y or game.window.getHeight() * 2 / 3
    newGoldChain.size = config.size or {
        x = 30,
        y = 25
    }
    newGoldChain.isCollected = false

    return setmetatable(newGoldChain, self)
end

function GoldChain:update(dt)
    self:updatePhysics(dt)
end

function GoldChain:draw()
    if (not self.isCollected) then
    goldchainImg = love.graphics.newImage("assets/images/goldchain.png")
    love.graphics.draw(goldchainImg, self.x, self.y)
    end
end

function GoldChain:collide(other)
    if other.type == "player" then
        --self.graphics 
        --collectgarbage("collect")
        self.isCollected = true
    end
end
