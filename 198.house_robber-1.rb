# @param {Integer[]} nums
# @return {Integer}
def rob(nums)
    houses = nums
    house1, house2 = 0, 0

    houses.each do |house|
        # recurence relation step [hous1, house2, house, house - 1, house - 2, ...]
        temp = [house1 + house, house2].max 
        house1 = house2
        house2 = temp
    end

    house2
end