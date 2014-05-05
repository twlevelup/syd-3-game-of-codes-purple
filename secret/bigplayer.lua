require 'player'
require 'secret/items'

BigPlayer = Class{__includes=Player,
    init = function(self, game, config)
        local config = config or {}
        config.size = {x = 45, y = 177}
        config.graphics = {source = "assets/images/smallbigalien.png"}
        Player.init(self, game, config)
        self.hat = true
    end;

    loseHat = function(self)
        self.graphics.source = "assets/images/smallbigaliennothat.png"
        self.size = {x = 45, y = 147}
        self:newAnimation()
        self.y = self.y + 29
        self.hat = false
    end
}

Hat = Class{__includes=Item,
    file = "assets/images/hat.png",

    init = function(self, game, config)
        Item.init(self, game, config)
        self.type = "hat"
    end;

    update = function(self, game, config)
        self.vel.x = 300
        Item.update(self, game, config)
    end
}
