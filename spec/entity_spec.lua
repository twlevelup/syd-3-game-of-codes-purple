require 'entity'

describe("Entity", function()
    local baseEntity, collidingEntity, nonCollidingEntity

    before_each(function()
        baseEntity = Entity:new({})
        baseEntity.x = 10
        baseEntity.y = 10
        baseEntity.size = {
            x = 10,
            y = 10
        }

        collidingEntity = Entity:new({})
        collidingEntity.x = 15
        collidingEntity.y = 15
        collidingEntity.size = {
            x = 10,
            y = 10
        }

        nonCollidingEntity = Entity:new({})
        nonCollidingEntity.x = 30
        nonCollidingEntity.y = 30
        nonCollidingEntity.size = {
            x = 10,
            y = 10
        }

        spy.on(baseEntity, "collide")
    end)

    describe ("bounds", function()
        local entity

        before_each(function()
            entity= Entity:new({})
            entity.x = 10
            entity.y = 10
            entity.size = {
                x = 10,
                y = 15
            }
        end)

        it("should set the top at its vertical position", function()
            assert.is.equal(entity:bounds().top, 10)
        end)

        it("should set the left at its horizontal position", function()
            assert.is.equal(entity:bounds().left, 10)
        end)

        it("should set the right at its horizontal position plus size", function()
            assert.is.equal(entity:bounds().right, 20)
        end)

        it("should set the bottom at its vertical position plus size", function()
            assert.is.equal(entity:bounds().bottom, 25)
        end)
    end)

    describe("collidingWith", function()
        it("should collide when two entities bounding boxes are intersecting", function()
            assert.is.equal(baseEntity:collidingWith(collidingEntity), true)
        end)

        it("should collide when two entities bounding boxes are touching horizontally", function()
            collidingEntity.x = 20
            collidingEntity.y = 10

            assert.is.equal(baseEntity:collidingWith(collidingEntity), true)
        end)

        it("should collide when an entity is horizontally inside another entity's bounding box", function()
          local collider = Entity:new({})
          collider.x  = 12
          collider.y = 12
          collider.size = {
            x = 3,
            y = 12
          }

          assert.is.equal(collider:collidingWith(baseEntity), true)
        end)

        it("should collide when an entity is vertically inside another entity's bounding box", function()
          local collider = Entity:new({})
          collider.x  = 12
          collider.y = 12
          collider.size = {
            x = 12,
            y = 3
          }

          assert.is.equal(collider:collidingWith(baseEntity), true)
        end)

        it("should collide when two entities bounding boxes are touching vertically", function()
            collidingEntity.x = 10
            collidingEntity.y = 20

            assert.is.equal(baseEntity:collidingWith(collidingEntity), true)
        end)

        it("should not collide when two entities bounding boxes are not intersecting", function()
            assert.is.equal(baseEntity:collidingWith(nonCollidingEntity), false)
        end)
    end)

    describe("physics", function()
        describe("#calculateVelocity", function()
            it("should have a velocity of zero", function()
                local dt = 10
                local currentVel = 0
                local acceleration = 0
                local drag = 0
                assert.is.equal(0, calculateVelocity(dt, currentVel, acceleration, drag))
            end)
            it("should update it's acceleration", function()
                local dt = 10
                local currentVel = 0
                local acceleration = 1
                local drag = 0
                assert.is.equal(10, calculateVelocity(dt, currentVel, acceleration, drag))
            end)
            describe('positive velocity', function()
                it("should decrement velocity by dt * drag", function()
                    local dt = 10
                    local currentVel = 100
                    local acceleration = 0
                    local drag = 1
                    assert.is.equal(90, calculateVelocity(dt, currentVel, acceleration, drag))
                end)
                it("should reset velocity to zero", function()
                    local dt = 10
                    local currentVel = 1
                    local acceleration = 0
                    local drag = 1
                    assert.is.equal(0, calculateVelocity(dt, currentVel, acceleration, drag))
                end)

            end)
            describe('negative velocity', function()
                it("should decrement velocity by dt * drag", function()
                    local dt = 10
                    local currentVel = -100
                    local acceleration = 0
                    local drag = 1
                    assert.is.equal(-90, calculateVelocity(dt, currentVel, acceleration, drag))
                end)
                it("should reset velocity to zero", function()
                    local dt = 10
                    local currentVel = -1
                    local acceleration = 0
                    local drag = 1
                    assert.is.equal(0, calculateVelocity(dt, currentVel, acceleration, drag))
                end)
            end)
        end)
        describe('#calculateNewCoordinateFromVelocity', function()
            it('should add the velocity to when not zero', function()
                local coordinate = 10
                local velocity = 5
                local dt = 10
                assert.is.equal(60, calculateNewCoordinateFromVelocity(coordinate, velocity, dt))
            end)
            it('should return the coordinate when velocity is zero', function()
                local coordinate = 10
                local velocity = 0
                local dt = 10
                assert.is.equal(10, calculateNewCoordinateFromVelocity(coordinate, velocity, dt))
            end)
        end)
        describe('#getConstrainedPoint', function()
            it('should return the same value when within range', function()
                local value = 50
                local min = 10
                local max = 100
                assert.is.equal(50, getConstrainedPoint(value, min, max))
            end)
            it('should return the lower limit when point is below it', function()
                local value = -20
                local min = 10
                local max = 100
                assert.is.equal(10, getConstrainedPoint(value, min, max))
            end)
            it('should return the upper limit when point is above it', function()
                local value = 150
                local min = 10
                local max = 100
                assert.is.equal(100, getConstrainedPoint(value, min, max))
            end)
        end)
    end)
end)
