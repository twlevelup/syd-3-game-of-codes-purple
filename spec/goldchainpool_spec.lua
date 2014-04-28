require 'goldchainpool'
require 'spec/love-mocks'

describe("goldchainpool", function()
    before_each(function()
      Gamestate = mock_gamestate()
    end)

    describe("#newRandomChain", function()
      it("should create a new chain with random x", function()
          local pool = GoldChainPool:new(mock_love())

          math.randomseed(1234)
          local goldchain1 = pool:newRandomChain(mock_love())

          math.randomseed(4567)
          local goldchain2 = pool:newRandomChain(mock_love())

          assert.are_not.equal(goldchain1.x, goldchain2.x)
          assert.are_not.equal(goldchain1.y, goldchain2.y)
      end)
    end)

    describe("#replaceChain", function()
        it("should replace the current chain with a new random chain", function()
            local pool = GoldChainPool:new(mock_love(), {maxChainAge = 9})
            assert.are.equal(pool.chain, nil)

            pool:replaceChain()
            assert.are_not.equal(pool.chain, nil)
        end)
    end)

    describe("#chainIsExpired", function()
        it("should be true when a fixed time has passed", function()
            local pool = GoldChainPool:new(mock_love(), {maxChainAge = 9})
            pool:replaceChain()

            pool.chainAge = 2
            assert.is_not_true(pool:chainIsExpired())

            pool.chainAge = 9990
            assert.is_true(pool:chainIsExpired())

            pool.chainAge = 2
            pool.chain.isCollected = true
            assert.is_true(pool:chainIsExpired())
        end)
    end)
end)
