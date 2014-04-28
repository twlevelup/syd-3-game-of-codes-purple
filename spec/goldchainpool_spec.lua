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
            local goldchain = GoldChainPool:new(mock_love())
        end)
    end)

    describe("#chain", function()
      it("should only have one chain at a time and start with no chain", function()
      end)
    end)

    describe("#chainIsExpired", function()
      it("should be true when a fixed time has passed", function()
      end)
    end)
end)
