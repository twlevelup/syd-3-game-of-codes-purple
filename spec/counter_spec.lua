require 'counter'
require 'spec.love-mocks'

describe('Counter', function()

  local love = mock_love()

  describe('#toString', function()
    it('should display the correct format', function()
      local counter = Counter(love, {count = 2, interval = 1, maxcount = 3})

      assert.is.equal("2 / 3", counter:toString())
    end)
  end)

  describe('#update', function()
    it('should be at the top left and not move', function()
      local counter = Counter(love, {count = 2, interval = 1, maxcount = 3})
      local xpos = (0 + counter.size.x)
      local ypos = (love.window.getHeight() * 0.1)
      assert.is.equal(counter.x, xpos)
      assert.is.equal(counter.y, ypos)
    end)
  end)

  
end)
