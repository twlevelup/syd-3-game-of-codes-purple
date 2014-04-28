GoldChainPool = {}
GoldChainPool.__index = GoldChainPool
-- setmetatable(GoldChain, {__index = Entity})

function GoldChainPool:new(game, config)
    local newPool = {
      chain = nil,
      game = game,
      chainAge = 99,
      maxChainAge = 3
    }

    setmetatable(newPool, self)
    return newPool
end

function GoldChainPool:newRandomChain()
    local chain = GoldChain:new(self.game)

    min_x = chain.size.x / 2
    max_x = self.game.window.getWidth() - chain.size.x / 2
    min_y = 0
    max_y = self.game.window.getHeight()

    chain.x = math.random(min_x, max_x)
    chain.y = math.random(min_y, max_y)
    while chain:isCollidingWithAnything() do
      chain.y = math.random(min_y, max_y)
    end

    return chain
end

function GoldChainPool:replaceChain()
    self.chain = self:newRandomChain()
    self.chainAge = 0
end

function GoldChainPool:chainIsExpired()
    return self.chainAge >= self.maxChainAge
end

function GoldChainPool:update(dt)
    if self:chainIsExpired() then
      self:replaceChain()
    end
    self.chainAge = self.chainAge + dt
end

function GoldChainPool:draw()
end
