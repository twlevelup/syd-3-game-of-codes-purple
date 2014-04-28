require 'player'
require 'entity'
require 'spec.love-mocks'

describe("Player", function()
    local dt = 1

    describe("#update", function()
        mock_animation = function()
            local animation_spy = {
                update = spy.new(function(dt) end),
                flipH = spy.new(function() end),
                gotoFrame = spy.new(function() end)
            }

            return animation_spy
        end

        describe("startPosition", function()
          it("should start 10% from the bottom left of the stage", function()
            local love = mock_love()
            local player = Player:new(love)
            assert.is.equal(player.x, love.window.getWidth()*0.1-(player.size.x/2))
            assert.is.equal(player.y, love.window.getHeight()*0.9-(player.size.y))
          end)
        end)

        describe("lastPosition", function()
            it("should store the last position before moving vertically", function()
                orig_x = 10
                orig_y = 10
                local player = Player:new(
                    mock_input('none'),
                    {
                        x = orig_x,
                        y = orig_y,
                    }
                )
                player.acc = {x = 0, y = 0}
                player.vel = {x = 0, y = 5}
                player:update(dt)

                assert.is.equal(player.x, 10)
                assert.is.equal(player.y, 15)
                assert.are.same(player.lastPosition, {x = orig_x, y = orig_y})
            end)

            it("should store the last position before moving horizonally", function()
                orig_x = 10
                orig_y = 10
                local player = Player:new(
                    mock_input('none'),
                    {
                        x = orig_x,
                        y = orig_y,
                    }
                )
                player.acc = {x = 0, y = 0}
                player.vel = {x = 5, y = 0}
                player:update(dt)

                assert.is.equal(player.x, 15)
                assert.is.equal(player.y, 10)
                assert.are.same(player.lastPosition, {x = orig_x, y = orig_y})
            end)
        end)

        describe("animating the player", function()
            describe("the animation frame", function()
                it("should stop updating when the player isn't moving", function()
                    local player = Player:new(mock_input('none'))
                    player.graphics.animation = mock_animation()
                    player:update(dt)

                    assert.spy(player.graphics.animation.gotoFrame).was.called()
                    assert.spy(player.graphics.animation.update).was_not.called()
                end)

                it("should update the animation state when the player is moving", function()
                    local player = Player:new(mock_input('right'))
                    player.graphics.animation = mock_animation()

                    player:update(dt)

                    assert.spy(player.graphics.animation.update).was.called()
                end)
            end)
        end)

        describe("collide", function()
            local player, collidingEntity

            before_each(function()
                player = Player:new(mock_input('none'))
                player.size = {
                    x = 10,
                    y = 10
                }
                player.x = 20
                player.y = 10
                player.graphics.animation = mock_animation()

                collidingEntity = Entity:new(mock_input('none'))
                collidingEntity.x = 10
                collidingEntity.y = 10
                collidingEntity.size = {
                    x = 10,
                    y = 10
                }
            end)

            it("should move the player to its last position when colliding on the left side", function()
                player.lastPosition = {x = 21, y = 10}

                player:collide(collidingEntity)

                assert.is.equal(player.x, 21)
                assert.is.equal(player.y, 10)
            end)

            it("should move the player to its last position when colliding on the right side", function()
                player.lastPosition = {x = 9, y = 10}

                player:collide(collidingEntity)

                assert.is.equal(player.x, 9)
                assert.is.equal(player.y, 10)
            end)

            it("should move the player to its last position when colliding on the top side", function()
                player.lastPosition = {x = 10, y = 11}

                player:collide(collidingEntity)

                assert.is.equal(player.x, 10)
                assert.is.equal(player.y, 11)
            end)

            it("should move the player to its last position when colliding on the bottom side", function()
                player.lastPosition = {x = 10, y = 9}

                player:collide(collidingEntity)

                assert.is.equal(player.x, 10)
                assert.is.equal(player.y, 9)
            end)
        end)

        describe("player movement", function()
            it("should decrement the player's y if the up-arrow is pressed", function()
                local player = Player:new(mock_input('jump'))
                player.acc = {x = 0, y = 0}
                player.vel = {x = 0, y = 0}
                player.jumpSpeed = -200
                local orig_y = player.y

                player:update(dt)

                assert.is.equal(orig_y - 200, player.y)
            end)

            it("should increment the player's y if the down-arrow is pressed", function()
                local player = Player:new(mock_input('down'))
                player.acc = {x = 0, y = 0}
                player.vel = {x = 0, y = 0}
                player.speed = 200
                local orig_y = player.y

                player:update(dt)

                assert.is.equal(orig_y + 200, player.y)
            end)

            it("should decrement the player's x if the left-arrow is pressed", function()
                local player = Player:new(mock_input('left'))
                player.acc = {x = 0, y = 0}
                player.vel = {x = 0, y = 0}
                player.speed = 200
                player.x = 500
                local orig_x = player.x

                player:update(dt)

                assert.is.equal(orig_x - 200, player.x)
            end)

            it("should increment the player's x if the right-arrow is pressed", function()
                local player = Player:new(mock_input('right'))
                player.acc = {x = 0, y = 0}
                player.vel = {x = 0, y = 0}
                player.speed = 200
                local orig_x = player.x

                player:update(dt)

                assert.is.equal(orig_x + 200, player.x)
            end)
        end)
    end)
end)
