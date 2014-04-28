require "entity"
--The only collectible in the game

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

function GoldChain:new_random(game, config)
    local chain = GoldChain:new(game, config)

    min_x = chain.size.x / 2
    max_x = game.window.getWidth() - chain.size.x / 2

    chain.x = math.random(min_x, max_x)
    chain.y = 0
    return chain
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
        if (not self.isCollected) then
        self.isCollected = true
        game.counter:increaseTen()
        end
    end
end
