require 'platform'
require 'spec/love-mocks'

describe("Platform", function()

    mock_graphics = function()
        local graphics_spy = {
            rectangle = spy.new(function() end),
            setColor = spy.new(function() end)
        }

        return graphics_spy
    end

    describe("#update", function()
        it("should not move on the screen", function()

            local platform = Platform(mock_love())

            platform.x = 100
            platform.y = 100
            platform.size.x = 100
            platform.size.y = 30


            platform:update(1)


            assert.are.equal(30, platform.size.y)
            assert.are.equal(100, platform.x)
            assert.are.equal(100, platform.y)
            assert.are.equal(100, platform.size.x)

        end)
    end)

    describe("#draw", function()
        it ("should draw platform", function()
            game = mock_love()
            game.graphics = mock_graphics()
            platform = Platform(game)
            platform:draw()

            --assert.spy(game.graphics.rectangle).was.called_with("fill", 100, 100, 100, 30)
            assert.spy(game.graphics.rectangle).was.called()
        end )
    end)


end)

