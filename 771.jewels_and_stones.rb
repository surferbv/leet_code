# 771.jewels_and_stones.rb
# @param {String} jewels
# @param {String} stones
# @return {Integer}
# 
# hash approach
# 
# time: O(j+s) where j and s are the number of stones.  
# 
# space: O(1) since we have at most 26 characters in the alphabet.
def num_jewels_in_stones(jewels, stones)
    num_jewels  = 0
    seen_jewels = {}

    jewels.each_byte do |jewel|
        seen_jewels[jewel] = 1
    end

    stones.each_byte do |stone| 
        num_jewels += 1 if seen_jewels.key?(stone)
    end

    num_jewels
end


# iterative approach
# 
# time: O(j*s) where j and s are the number of stones.
# 
# space: O(1) since we have at most 26 characters in the alphabet.
def num_jewels_in_stones(jewels, stones)
    num_jewels = 0
    
    jewels.each_byte do |j| 
        stones.each_byte do |s|
            num_jewels +=1 if s == j
        end 
    end

    num_jewels
end