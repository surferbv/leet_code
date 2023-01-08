=begin

    title:
        350. Intersection of Two Arrays II

    links:
        https://leetcode.com/problems/intersection-of-two-arrays-ii/description/

    approach:
        hash table approach 

    time: O(n1 + n2)

    space: O(min(n1,n2))
        We only hold the smaller of the two values in the hash.
        Since it's the intersection, we can have at most n1.length values
        if n1 is the smallest in length. The worst case n1 and n2 are the 
        the same length. 

    note:
        Use a hash and instead of storing the result in a separate array
        we could have used the smaller array to store the result and return it. 
        We can also solve by sorting the input first. Last approach be to use
        built in intersection. 

    til:

    results:
        Runtime 95 ms Beats 78.26% Memory 211.3 MB Beats 60.87%

=end
# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer[]}
def intersect(nums1, nums2)
    result  = []    
    hash    = Hash.new(0)
    
    # set nums1 as the smallest
    if nums1.length > nums2.length
        tmp      = nums1
        nums1    = nums2
        nums2    = tmp
    end

    nums1.each do |n|
        hash[n] += 1
    end

    nums2.each do |n|
        if hash.key?(n) && hash[n] > 0
            result << n
            hash[n] -= 1
        end
    end

    return result
end
