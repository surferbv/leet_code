# 11.container_with_most_water.rb
# @param {Integer[]} height
# @return {Integer}
#
=begin

    brute force approach

    time: O(n^2)
        Since we go through all n and for each 
        n we have to compute the max area thus
        n * n = n^2

    space: O(1)
        We don't create any additional data structures. 

    note:
        Again could not come up with this the first time. 

=end
def max_area(height)
    max_area = 0

    for l in (0..height.length - 1) do
        for r in (l + 1..height.length - 1) do
            area = (r - l) * [height[l], height[r]].min
            max_area = [area, max_area].max
        end
    end

    return max_area
end

=begin

    two pointer approach

    time: O(n)
        Even thought we use two pointer l and r
        we moved them towards each other. 
        We still have to go through all the values in the 
        array to find the max thus O(n)

    space: O(1)

    note:
        Did not come up with the algorithm had to see how 
        they did it on neet code but after walking through 
        the algorithm conceptually I was able to code up the 
        solution. 

=end
def max_area(height)
    max_area = 0
    l = 0
    r = height.length - 1

    while l < r
        area = (r-l) * [height[l], height[r]].min
        max_area = [area, max_area].max
        
        if height[l] < height[r]
            l += 1 
        else
            r -= 1
        end

    end

    return max_area
end