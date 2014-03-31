require 'ground'

describe("Ground", function()

        mock_graphics = function()
            local graphics_spy = {
                line = spy.new(function() end),
                circle = spy.new(function() end)
            }

            return graphics_spy
        end

        mock_game = function()
            local game_spy = {
              window = {
                getWidth = function() return 800 end,
                getHeight = function() return 600 end
              }
            }

            return game_spy
        end

  describe("#draw", function()
      it("should draw a straight line across the screen", function()
        game = mock_game()
        ground = Ground:new(game)
        ground.graphics = mock_graphics()
        ground:draw()

        assert.spy(ground.graphics.line).was.called()
        assert.spy(ground.graphics.circle).was.called()
      end)
  end)

  describe("#x", function()
    it("should be at the left edge of the screen", function()
      game = mock_game()
      game.window.getWidth = function() return 600 end
      ground = Ground:new(game)
      assert.are.equal(ground.x, 0)

      game = mock_game()
      game.window.getWidth = function() return 800 end
      ground = Ground:new(game)
      assert.are.equal(ground.x, 0)
    end)
  end)

  describe("#y", function()
    it("should be 10% from the bottom of the screen", function()
      game = mock_game()
      game.window.getHeight = function() return 600 end
      ground = Ground:new(game)
      assert.are.equal(ground.y / game.window.getHeight(), 0.9)

      game = mock_game()
      game.window.getHeight = function() return 800 end
      ground = Ground:new(game)
      assert.are.equal(ground.y / game.window.getHeight(), 0.9)
    end)
  end)

  describe("#size", function()
    it("should be the width of the window", function()
      game = mock_game()
      ground = Ground:new(game)
      assert.are.equal(ground.size.x, game.window.getWidth())
      assert.are.equal(ground.size.y, 0)
    end)
  end)

  describe("#update", function()
    it("doesn't change the position", function()
      ground = Ground:new(game)
      ground.graphics = mock_graphics()

      start_pos = {x = ground.x, y = ground.y}
      ground:update(0.1)
      end_pos = {x = ground.x, y = ground.y}
      assert.are.equal(start_pos.x, end_pos.x)
      assert.are.equal(start_pos.y, end_pos.y)
    end)
  end)


end)