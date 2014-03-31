require 'input'
require 'player'
require 'obstacle'
require 'timer'
require 'ground'
require 'version'

love.animation = require 'vendor/anim8'

local entities = {}
local stageElements = {}
local ground = Ground:new(love)
local player = Player:new(love)
local obstacle = Obstacle:new(love, {x = 200, y = 200})
local timer = Timer:new(love, {timeLimit = 100, stageWidth = love.window.getWidth(), stageHeight = love.window.getHeight()})

function love.load()
    print("Version: " .. version)

    table.insert(entities, ground)
    table.insert(entities, player)
    table.insert(entities, obstacle)
    table.insert(stageElements, timer)

    love.input.bind('up', 'up')
    love.input.bind('left', 'left')
    love.input.bind('right', 'right')
    love.input.bind('down', 'down')
end

function love.update(dt)
    for _, entity in pairs(entities) do
        entity:update(dt)

        for _, other in pairs(entities) do
            if other ~= entity then
                if entity:collidingWith(other) then
                    entity:collide(other)
                end
            end
        end
    end
    for _, entity in pairs(stageElements) do
        entity:update(dt)
    end
end

function love.draw()
    for _, e in pairs(entities) do
        e:draw()
    end
    for _, e in pairs(stageElements) do
        e:draw()
    end
    
end
