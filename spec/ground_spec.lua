require 'ground'
require 'spec.love-mocks'

describe("Ground", function()

    describe("#x", function()
        it("should be at the left edge of the screen", function()
            game = mock_love()
            ground = Ground:new(game)
            assert.are.equal(ground.x, 0)
        end)
    end)

    describe("#y", function()
        it("should be 10% from the bottom of the screen", function()
            game = mock_love()
            ground = Ground:new(game)
            assert.are.equal(ground.y / game.window.getHeight(), 0.9)
        end)
    end)

    describe("#size", function()
        it("should be the width of the window", function()
            game = mock_love()
            ground = Ground:new(game)
            assert.are.equal(ground.size.x, game.window.getWidth())
        end)
    end)

    describe("#update", function()
        it("doesn't change the position", function()
            game = mock_love()
            ground = Ground:new(game)
            start_pos = {x = ground.x, y = ground.y}
            ground:update(1)
        end_pos = {x = ground.x, y = ground.y}
        assert.are.equal(start_pos.x, end_pos.x)
        assert.are.equal(start_pos.y, end_pos.y)
    end)
end)


end)
