require 'globals'

Timer = {}
Timer.__index = Timer

function Timer.new(timeLimit)
  local timer = {
    _timeLimit = timeLimit,
    _startTime = 0,
    _currentTime = 0,
    _timeRemaining = 0,
    _finished = false
  }

  return setmetatable(timer, Timer)
end

function Timer:update(currentTime)
  if(self._finished) then
    return
  end

  if(not self._startTime ) then
    self._startTime = currentTime
  end

  local elapsedTime = currentTime - self._startTime
  self._timeRemaining = self._timeLimit - elapsedTime

  self._finished = (self:toString() == "00:00" and true or false)
end

function Timer:toString()
  return os.date(GAME_TIME_FORMAT, self._timeRemaining)
end
