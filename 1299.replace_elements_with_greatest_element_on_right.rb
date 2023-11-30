# 1299.replace_elements_with_greatest_element_on_right
# @param {Integer[]} arr
# @return {Integer[]}
#
# notes: 
# trick here is to iterate from the back to the front 
# holding onto the largest value that you've seen and replacing it with current
#
def replace_elements(arr)
    # repalce last element with -1
    max = -1

    # since we've replaced the last element we continue to check the remaining elements
    (arr.length - 1).downto(0) do |i|
        # this alsmost feels like a linked list reversal
        tmp = arr[i] # here you store the previous value of arr[i] in temp
        arr[i] = max # now you assigne what was the largest value to that spot
        max = [tmp, max].max # and from the two you've seen you update the max to hold the new max
    end
    
    arr
end