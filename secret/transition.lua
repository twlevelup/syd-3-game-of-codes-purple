require 'abstract/stage'
require 'secret/windy'
require 'secret/easter'
require 'secret/caption'

transition = {}
transition.__index = transition
setmetatable(transition, {__index = stage})

function transition:enter()
    stage.init(self)
    self.timer:clear()
    table.insert(self.stageElements, CowEgg(love))
    self.timer:add(1, function()
        table.insert(self.stageElements, SpaceEgg(love))
    end)
    self.timer:add(4, function()
        Gamestate.switch(caption, windy, "What?! Stupid Cow Captor.\nP.S Try getting\nKanye's favourite number", 1.5)
    end)
end
