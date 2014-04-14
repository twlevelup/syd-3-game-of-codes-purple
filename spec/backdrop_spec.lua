require 'backdrop'
require 'spec.love-mocks'

describe('Backdrop', function()

  before_each(function()
    game = mock_love()
  end)

  describe("#draw", function()
    it("should draw an image", function()
      bd = Backdrop:new(game)

      bd:draw()
      assert.spy(game.graphics.draw).was.called()
    end)
  end)

  describe("#size", function()
    it("should be the width of the window", function()
      bd = Backdrop:new(game)
      assert.are.equal(bd.size.x, game.window.getWidth())
      assert.are.equal(bd.size.y, game.window.getHeight())
    end)
  end)

  describe("#update", function()
    it("doesn't change the position", function()
      bd = Backdrop:new(game)
      start_pos = {x = bd.x, y = bd.y}
      bd:update(1)
      end_pos = {x = bd.x, y = bd.y}
      assert.are.equal(start_pos.x, end_pos.x)
      assert.are.equal(start_pos.y, end_pos.y)
    end)
  end)
end)
