# 1431.kids_with_the_greatest_number_of_candies
# @param {Integer[]} candies
# @param {Integer} extra_candies
# @return {Boolean[]}
# 
# Algorithm:
# Given the number of candies array
# we give all our extra candies to the first child and then
# we compare it with every other child to see if it is the greatest.
# if it is we mark it in a separate array as true else false
# we then repeat this process with all the other children until we reach the end
# and return the result. 
# 
# brute force approach
# 
# time: O(n^2) because we have to loop through all n children and 
#       add the extra candies to each one and compare to see if it is the max.
#
# space: O(n) we do return a new boolean array which. 
def kids_with_candies(candies, extra_candies)
    greatest_number = [] 

    for i in (0..candies.length - 1) do
        greatest_number[i] = true
        greatest = extra_candies + candies[i]
        
        for j in (0..candies.length - 1) do
            if greatest < candies[j] && i != j
                greatest_number[i] = false
                break
            end
        end
    end

    greatest_number
end

# finding the max approach
# 
# time: O(n^2 log n ) hmm how is this suppose to be better?
#       Sill have to iterate over the whole array n times and then 
#       we find the max of each time which I'm assuming is n log n using 
#       some implementation of quick sort in finding the largest number. 
#
# space: O(n) still need to create an result boolean array greatest_number
def kids_with_candies(candies, extra_candies)
    greatest_number = [] 

    candies.each do |candy| # n times 
        if candy + extra_candies >= candies.max # finding the max takes O(n log n) for sorting and then getting the max O(1)
            greatest_number.push(true)
        else
            greatest_number.push(false)
        end     
    end

    greatest_number
end

# finding the max appraoch once
# 
# time: O(n) Since we only have to iterate only once and we get the max initially.
#
# space: O(1) since we allocate a result array for fixed size which is at most 100.
def kids_with_candies(candies, extra_candies)
    current_max = candies.max # takes O(n log n) ?
    greatest_number = Array.new(candies.length, false) # init an array of same size as candies and set to false

    candies.each_with_index do |candy, i|
        greatest_number[i] = true if candy + extra_candies >= current_max
    end

    greatest_number
end
