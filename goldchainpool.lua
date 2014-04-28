GoldChainPool = {}
GoldChainPool.__index = GoldChainPool
-- setmetatable(GoldChain, {__index = Entity})

function GoldChainPool:new(game, config)
    local pool = {}

    setmetatable(pool, self)
    return pool
end

function GoldChainPool:newRandomChain(game, config)
    local chain = GoldChain:new(game, config)

    min_x = chain.size.x / 2
    max_x = game.window.getWidth() - chain.size.x / 2
    min_y = 0
    max_y = game.window.getHeight()

    chain.x = math.random(min_x, max_x)
    chain.y = math.random(min_y, max_y)
    while chain:isCollidingWithAnything() do
      chain.y = math.random(min_y, max_y)
    end

    return chain
end
