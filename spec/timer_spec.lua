require 'timer'
require 'globals'

describe('Timer', function()
  describe('#toString', function()
    it('should display the correct format', function()
      local limitInSeconds = 110
      local timer = Timer.new(limitInSeconds)

      assert.truthy(string.match(timer:toString(), '%d%d:%d%d'))
    end)
  end)

  describe('#update', function()
    it('should countdown 9 seconds', function()
      local startTime = os.time{year=2014, month=3, day=27, hour=9, minute=16, sec=0}
      local finishTime = os.time{year=2014, month=3, day=27, hour=9, minute=16, sec=9}
      local limitInSeconds = 110
      local timer = Timer.new(limitInSeconds)

      timer:update(startTime)
      assert.is.equal("01:50", timer:toString())

      timer:update(finishTime)
      assert.is.equal("01:41", timer:toString())
    end)

    it('should stop at 00:00 and not go negative', function()
      local limitInSeconds = 10
      local timer = Timer.new(limitInSeconds)

      for i=0, limitInSeconds + 1 do
        local time = os.time{year=2014, month=3, day=27, hour=9, minute=16, sec=i}
        timer:update(time)
        assert.is_not.equal("59:59", timer:toString())
      end
    end)
  end)
end)
