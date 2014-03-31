require 'timer'
require 'globals'

describe('Timer', function()
  describe('#toString', function()
    it('should display the correct format', function()
      local limitInSeconds = 110
      local timer = Timer:new(_, {timeLimit = limitInSeconds})

      assert.truthy(string.match(timer:toString(), '%d%d:%d%d'))
    end)
  end)

  describe('#update', function()
    it('should countdown 9 seconds', function()
      local limitInSeconds = 110
      local timer = Timer:new(_, {timeLimit = limitInSeconds})

      timer:update(0)
      assert.is.equal("01:50", timer:toString())

      timer:update(9)
      assert.is.equal("01:41", timer:toString())
    end)

    it('should stop at 00:00 and not go negative', function()
      local limitInSeconds = 10
      local timer = Timer:new(_, {timeLimit = limitInSeconds})

      for i=0, limitInSeconds + 1 do
        timer:update(1)
        assert.is_not.equal("59:59", timer:toString())
      end
    end)
  end)
end)

