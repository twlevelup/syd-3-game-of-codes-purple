Backdrop = {}
Backdrop.__index = Backdrop

function Backdrop:new(game, config)
    local config = config or {}

    local newBackdrop = {}
    newBackdrop.game = game
    newBackdrop.x = config.x or 0
    newBackdrop.y = config.y or 0
    newBackdrop.rot = config.rot or 0
    newBackdrop.size = config.size or {
        x = game.window.getWidth(),
        y = game.window.getHeight()
    }
    newBackdrop.path = config.file or "/assets/images/skyline-bg-grey.png"

    return setmetatable(newBackdrop, self)
end

function Backdrop:getImage()
  if not self.image then
    self.image = self.game.graphics.newImage(self.path)
  end

  return self.image
end

function Backdrop:draw()
  if self:getImage() then
    sx = self.size.x / self:getImage():getWidth()
  else
    sx = 1
  end
  self.game.graphics.draw(self:getImage(), self.x, self.y, self.rot, sx, sx)
end

function Backdrop:update(dt)
end
