# @param {Integer[]} arr
# @return {Integer[]}
#
# notes:
# given an array arr replace every element in that array
# with the greatest element to its right, and replace 
# the last element with -1
# return the array
def replace_elements(arr)
    # start from the back as this makes it easier
    # to compare the current max value or elmenet
    # from the right side. 
    max_from_right = -1 # starting with -1 b/c last 
                        # elemenmt is repalced by that

    (arr.length - 1).downto(0) do |i|
        # but we need to know what n was b/4 it's been over written
        temp = arr[i]
        arr[i] = max_from_right
        max_from_right = [temp, max_from_right].max
    end
    
    arr
end