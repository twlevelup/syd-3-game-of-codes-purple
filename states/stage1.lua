local stage1 = {}

function stage1:init()
  self.ground = Ground:new(love)
  self.player = Player:new(love)
  self.timer = Timer:new(love, {timeLimit = 110})
  self.backdrop = Backdrop:new(love)

  self.entities = {}
  self.stageElements = {}

  table.insert(self.entities, self.ground)
  table.insert(self.entities, self.player)
  table.insert(self.stageElements, self.backdrop)
  table.insert(self.stageElements, self.timer)
end

function stage1:enter(current, game)
  self.game = game
end

function stage1:update(dt)
  for _, entity in pairs(self.stageElements) do
      entity:update(dt)
  end
  for _, entity in pairs(self.entities) do
        entity:update(dt)
        for _, other in pairs(self.entities) do
            if other ~= entity then
                if entity:collidingWith(other) then
                    entity:collide(other)
                end
            end
        end
    end
end

function stage1:draw()
    --Draw stage elements
    for _, e in pairs(self.stageElements) do
        e:draw()
    end

    --Draw all entities
    for _, e in pairs(self.entities) do
        e:draw()
    end
end

function stage1:keyreleased(key)
  if key == love.input.mapping['pause'] then
    self.game.pause()
  end
end

return stage1
