# 1603.design_parking_system
# using class, instance variables, and switch statement
# time: O(1) no iteration just evaluation. 
# space: O(1) not storing anything in separate data structures. 
class ParkingSystem
    @@car_type = {big: 1, medium: 2, small: 3}

=begin
    :type big: Integer
    :type medium: Integer
    :type small: Integer
=end
    def initialize(big, medium, small)
        @big_limit    = big
        @medium_limit = medium
        @small_limit  = small

        @big_current    = 0
        @small_current  = 0
        @medium_current = 0

    end

=begin
    :type car_type: Integer
    :rtype: Boolean
=end
    def add_car(car_type)
        available = false

        case car_type

        when @@car_type[:big]
            if @big_current < @big_limit
                available = true 
                @big_current += 1
            end

        when @@car_type[:medium]
            if @medium_current < @medium_limit
                available = true 
                @medium_current += 1
            end

        when @@car_type[:small]
            if @small_current < @small_limit
                available = true 
                @small_current += 1
            end

        else
           "Not a valid car type!" 
        end

        return available
    end

end

# array technique
# time: O(1) since the runtime is not dependent on the input size.
# space: O(1) yes we do allocated an array of size four but its negligible.
class ParkingSystem
   
=begin
    :type big: Integer
    :type medium: Integer
    :type small: Integer
=end
    def initialize(big, medium, small)
        @avaliable_slots = [0,big,medium, small]
    end
    
    
=begin
    :type car_type: Integer
    :rtype: Boolean
=end
    def add_car(car_type)
        if 0 == @avaliable_slots[car_type]    
            return false
        else
            @avaliable_slots[car_type] -= 1
            return true
        end
    end
    
end

# Your ParkingSystem object will be instantiated and called as such:
# obj = ParkingSystem.new(big, medium, small)
# param_1 = obj.add_car(car_type)