require 'goldchain'
require 'spec/love-mocks'

describe("goldchain", function()

    mock_graphics = function()
        local graphics_spy = {
            rectangle = spy.new(function() end),
        }

        return graphics_spy
    end

    describe("#update", function()
        it("should not move on the screen", function()

            local goldchain = GoldChain(mock_love())

            goldchain.x = 30
            goldchain.y = 30
            goldchain.size.x = 30
            goldchain.size.y = 30


            goldchain:update(1)


            assert.are.equal(30, goldchain.size.y)
            assert.are.equal(30, goldchain.x)
            assert.are.equal(30, goldchain.y)
            assert.are.equal(30, goldchain.size.x)

        end)
    end)

  --[[  describe("#draw", function()
        it ("should draw gold chain", function()
            game = mock_love()
            game.graphics = mock_graphics()
            goldchain = GoldChain:new(game)
            goldchain:draw()

            --assert.spy(game.graphics.rectangle).was.called_with("fill", 100, 100, 100, 30)
            assert.spy(game.graphics.draw).was.called()
        end )
    end)
]]

end)

