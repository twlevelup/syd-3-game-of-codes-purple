require 'abstract/stage'
require 'secret/thug'
require 'secret/gold'
require 'platform'

windy = {}
windy.__index = windy
setmetatable(windy, {__index = stage})

function windy:init()
    self.wind = -200
    stage.init(self)
    self.clock:addPeriodic(1.5, function()
        thug = Thug:new(love, {wind = self.wind, gravity = self.gravity})
        table.insert(self.entities, thug)
    end)

    table.insert(self.entities, Gold:new(love))

end

function windy:update(dt)
    stage.update(self,dt)
    self:dropitem()
end

function windy:dropitem()
    chain = Gold:new(love)
    self:place(chain)
end
