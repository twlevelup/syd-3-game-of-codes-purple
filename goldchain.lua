require 'abstract/item'
Gamestate = require 'vendor/gamestate'
--The only collectible in the game

GoldChain = Class{__includes=Item,
file = "assets/images/goldchain.png",

init = function(self, game, config)
    Item.init(self, game, config)
    self.type = "collectible"
end;
}
