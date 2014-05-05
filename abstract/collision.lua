Class = require 'vendor/class'

Collision = Class{

    bounds = function(self)
        return {
            top = self.y,
            left = self.x,
            bottom = self.y + self.size.y,
            right = self.x + self.size.x
        }
    end;

    collidingWith = function(self, other)
        local bounds = self:bounds()
        local other = other:bounds()

        local my_left_overlaps_their_right = bounds.left <= other.right and
        bounds.right >= other.right
        local my_right_overlaps_their_left = bounds.right >= other.left and
        bounds.left <= other.left

        local contained_in_them_horizontally = bounds.left >= other.left and bounds.right <= other.right
        local contained_in_them_vertically = bounds.bottom <= other.bottom and bounds.top >= other.top

        local my_top_overlaps_their_bottom = bounds.top <= other.bottom and
        bounds.bottom >= other.bottom 
        local my_bottom_overlaps_their_top = bounds.bottom >= other.top and
        bounds.top <= other.top

        local is_colliding = (my_left_overlaps_their_right or
        my_right_overlaps_their_left or
        contained_in_them_horizontally) and
        (my_top_overlaps_their_bottom or
        my_bottom_overlaps_their_top or
        contained_in_them_vertically)

        if is_colliding then
            if my_left_overlaps_their_right and my_bottom_overlaps_their_top then 
                return 3
            elseif my_right_overlaps_their_left and my_bottom_overlaps_their_top then
                return 1
            elseif my_right_overlaps_their_left and my_top_overlaps_their_bottom then
                return 7
            elseif my_left_overlaps_their_right and my_top_overlaps_their_bottom then
                return 9
            elseif my_right_overlaps_their_left then
                return 4
            elseif my_left_overlaps_their_right then
                return 6
            elseif my_bottom_overlaps_their_top then
                return 2
            elseif my_top_overlaps_their_bottom then
                return 8
            else
                return 5
            end
        end
        return false
    end;

    collide = function(self, other, result)
    end

}
