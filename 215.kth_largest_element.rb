# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
# approach: sort the array and return the kth largest element
# time: O(nlogn)
# space: O(1) assuming the sorting is done in place
def find_kth_largest(nums, k)
  nums.sort! # O(nlogn)
  nums[nums.length - k] 
end

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
# approach: sort and reverse
# time: O(nlogn)
# space: O(1) assuming the sorting and reversing is done in place 
def find_kth_largest(nums, k)
  nums.sort_by!{|num| num}.reverse!
  print nums
  nums[k - 1] 
end


# appraoch: quick select
# time: O(n) on average, O(n^2) worst case
# space: O(n) 
# notes: Yeah right, I don't understand this solution at all need to revisist quick select.
# first get the pivot
# then partition the array into two parts how? 
# iterate through the array and swap the elements that are less than the pivot to the left
# and the elements that are greater than the pivot to the right
# then swap the pivot with the last element that is less than the pivot
# then return the index of the pivot
# Still getting TLE on leetcode
def find_kth_largest(nums, k)
  @nums = nums
  @k = @nums.length - k # kth largest index we are looking for

  def quick_select(l, r)
    j = rand(l..r) # swap the random index with the last index
    @nums[j], @nums[r] = @nums[r], @nums[j] # this is to avoid the worst case of O(n^2) when the array is already sorted

    pivot, p = @nums[r], l

    (l...r).each do |i|
      if @nums[i] < pivot
        @nums[p], @nums[i] = @nums[i], @nums[p]
        p += 1
      end
    end

    @nums[p], @nums[r] = @nums[r], @nums[p]

    if p > @k
      return quick_select(l, p - 1)
    elsif p < @k
      return quick_select(p + 1, r)
    else
      return @nums[p]
    end
  end

    return quick_select(0, @nums.length - 1)
end