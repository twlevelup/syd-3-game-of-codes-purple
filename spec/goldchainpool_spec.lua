require 'goldchainpool'
require 'spec/love-mocks'

describe("goldchainpool", function()
    describe("#newRandomChain", function()
      it("should create a new chain with random x", function()
          local pool = GoldChainPool:new(mock_love())

          math.randomseed(1234)
          local goldchain1 = pool:newRandomChain(mock_love())
          assert.are.equal(0 - goldchain1.size.y / 2, goldchain1.y)

          math.randomseed(4567)
          local goldchain2 = pool:newRandomChain(mock_love())
          assert.are_not.equal(goldchain1.x, goldchain2.x)
      end)

      -- it("should create a chain which is not colliding with anything", function()
      --     local pool = GoldChainPool:new(mock_love())
      --     local goldchain = pool:newRandomChain(mock_love())

      --     colliding = false
      --     assert.is_not_true(colliding)
      -- end)
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
