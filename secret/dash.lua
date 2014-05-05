require 'abstract/stage'
require 'secret/enemy'
require 'secret/items'
require 'secret/finale'
require 'platform'

dash = {}
dash.__index = dash
setmetatable(dash, {__index = stage})

function dash:enter()
    self:reset()
end

function dash:reset()
    self.wind = -200
    self.entities = {}
    self.stageElements = {}
    stage.init(self)
    self.item = nil
    self.timer:clear()
    self.timer:addPeriodic(0, function()
        thug = Thug(love, {y=math.random(0, self.height), gravity = self.gravity})
        table.insert(self.entities, thug)
    end)
    self.item = Gold(love)
    table.insert(self.entities, self.item)
    self.glasses = nil
end

function kanye()

end

function dash:haswon()
    if not self.player.alive then
        Gamestate.switch(windy)
    end
    return  (self.item.collected)
end

function dash:finish()
    if self.item.collected then
        Gamestate.switch(caption,finale, "Boss time!\nUse your golden hat with 'k'!", 2)
    end
end
