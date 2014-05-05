require 'clock'
require 'globals'
require 'spec.love-mocks'

describe('Clock', function()

  local love = mock_love()

  describe('#toString', function()
    it('should display the correct format', function()
      local limitInSeconds = 110
      local timer = Clock(love, {timeLimit = limitInSeconds})

      assert.truthy(string.match(timer:toString(), '%d:%d%d'))
    end)
  end)

  describe('#update', function()
    it('should countdown 9 seconds', function()
      local limitInSeconds = 110
      local timer = Clock(love, {timeLimit = limitInSeconds})

      timer:update(0)
      assert.is.equal("1:50", timer:toString())

      timer:update(9)
      assert.is.equal("1:41", timer:toString())
    end)

    it('should stop at 0:00 and not go negative', function()
      local limitInSeconds = 10
      local timer = Clock(love, {timeLimit = limitInSeconds})

      for i=0, limitInSeconds + 1 do
        timer:update(1)
        assert.is_not.equal("59:59", timer:toString())
      end
    end)

    it('should be at the top right on 10% margins', function()
      local timer = Clock(love, {timeLimit = 10})
      local xpos = (love.window.getWidth() * 0.9 - timer.size.x)
      local ypos = (love.window.getHeight() * 0.1)
      assert.is.equal(timer.x, xpos)
      assert.is.equal(timer.y, ypos)
    end)
  end)

  
end)
