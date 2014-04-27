require 'goldchainrapper'
require 'spec/love-mocks'

describe("goldchainrapper", function()

    mock_graphics = function()
        local graphics_spy = {
            rectangle = spy.new(function() end),
        }

        return graphics_spy
    end

    describe("#update", function()
        it("should not move on the screen", function()

            local goldchainrapper = GoldChainRapper:new(mock_love())

            goldchainrapper.x = 30
            goldchainrapper.y = 30
            goldchainrapper.size.x = 30
            goldchainrapper.size.y = 70


            goldchainrapper:update(1)


            assert.are.equal(70, goldchainrapper.size.y)
            assert.are.equal(30, goldchainrapper.x)
            assert.are.equal(30, goldchainrapper.y)
            assert.are.equal(30, goldchainrapper.size.x)

        end)
    end)

 --[[   describe("#draw", function()
        it ("should draw gold chain rapper", function()
            game = mock_love()
            game.graphics = mock_graphics()
            goldchainrapper = GoldChainRapper:new(game)
            goldchainrapper:draw()
            assert.spy(game.graphics.draw).was.called()
        end )
    end)
]]

end)

