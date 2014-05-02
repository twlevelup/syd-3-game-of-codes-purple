require 'abstract/item'

Gold = {}
Gold.__index = Gold
setmetatable(Gold, {__index = Item})

function Gold:new(game, config)
    self.picture = "assets/images/goldchain.png"
    Item.init(self, game, config)
    return self
end
