require 'platform'

describe("Platform", function()

	mock_graphics = function()
		local graphics_spy = {
			rectangle = spy.new(function() end),
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

    describe("#update", function()
        it("should not move on the screen", function()
            
            local platform = Platform:new(game)

            platform.x = 100
            platform.y = 100
            platform.width = 100
            platform.height = 30
            

            platform:update(1)


            assert.are.equal(30, platform.height)
            assert.are.equal(100, platform.x)
            assert.are.equal(100, platform.y)
            assert.are.equal(100, platform.width)

        end)
    end)

    describe("#draw", function()
    	it ("should draw platform", function()
    	game = mock_game
    	platform = Platform:new(game)
    	platform.graphics = mock_graphics()
    	platform:draw()

    	assert.spy(platform.graphics.rectangle).was.called_with("fill", 100, 100, 100, 30)
    	--assert.spy(platform.graphics.rectangle).was.called()
    	end )
    end)


  end)

