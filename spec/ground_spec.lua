require 'ground'

describe("Ground", function()

        mock_graphics = function()
            local graphics_spy = {
                line = spy.new(function() end)
            }

            return graphics_spy
        end

  describe("#draw", function()
      it("should draw a straight line across the screen", function()
        ground = Ground:new()
        ground.graphics = mock_graphics()
        ground:draw()

        assert.spy(ground.graphics.line).was.called()
      end)
  end)
end)
