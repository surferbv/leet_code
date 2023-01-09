=begin

    title:
        1920. Build Array from Permutation (easy)

    links:
        https://leetcode.com/problems/build-array-from-permutation/
        https://leetcode.com/problems/build-array-from-permutation/solutions/1315926/python-o-n-time-o-1-space-w-full-explanation/

    approach:
        auxiliary array approach    

    time: O(n)

    space: O(n)
        If we include the result

    note:
        This is a straight forward solution using arrays but the more interesting approach
        would be to do this in O(1) space. 
        One approach is to use long division lemma approach and the second is to 
        modify the existing data types storing the old and new value. 

    til:
        long division lemma a = qb + r

    results:
        Runtime 115 ms Beats 82.61% Memory 211.6 MB Beats 63.4%

=end
# @param {Integer[]} nums
# @return {Integer[]}
def build_array(nums)
    res = []

    nums.each do |n|
        res << nums[n]
    end
    
    return res
end


=begin

    approach:
        map approach 
    
    time: O(n)

    space: O(n)

    note:

    til:

    results:
        Runtime 106 ms Beats 95.65% Memory 211.6 MB Beats 15.22%

=end
# @param {Integer[]} nums
# @return {Integer[]}
def build_array(nums)    
    nums.map{ |n| nums[n]}
end
