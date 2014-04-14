mock_love = function()
    local love = {
        input = {
            pressed = function(a) end
        },
        window = {
            getWidth = function() return 800 end,
            getHeight = function() return 600 end
        },
        graphics = {
            draw = spy.new(function() end),
            newImage = spy.new(function() end),
            newQuad = spy.new(function() end)
        }
    }
    return love
end

mock_input = function(action)
    local love = mock_love()
    love.input = {
        pressed = function(a)
            if a == action then
                return true
            else
                return false
            end
        end
    }
    return love
end
