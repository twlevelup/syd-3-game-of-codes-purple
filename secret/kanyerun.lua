game = {}

local gravity = 1000
local wind = 0

function game:init()
  self.entities = {}
  self.stageElements = {}
  self.ground = Ground:new(love, {wind = wind})
  self.player = Player:new(love, {gravity = gravity, wind = wind})

}
