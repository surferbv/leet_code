# algorithm: binary search
# 1. declare two low and high pointers that will initially point to the first and last index of the array.
# 2. declare a middle pointer that will initially point to the middle index of the array. This divides the array into two halves.
# 3. check if the target is present at the middle pointer. If so, return the middle pointer.
# 4. if the first half of the array is sorted and the target lies in the range update the low pointer to the middle + 1 index in order to search the first half.
# 5. else if the second half of the array is sorted and the target lies in that range, update the low pointer to mid in order to search the second half.
# 6. if the high pointer becomes greater or equal to the low pointer, and we still haven't found the target, return -1.
# [6, 7, 1, 2, 3, 4, 5] , 6
#
# time: O(log n) 
# space: O(1)
def binary_search_rotated(nums, target):
  low  = 0
  high = len(nums) - 1

  if low > high:
    return -1

  while low <= high:
    mid = low + ((high - low) // 2)

    if nums[mid] == target:
      return mid

    if nums[low] <= nums[mid]:
      if nums[low] <= target <= nums[mid]:
        high = mid - 1
      else:
        low = mid + 1
    else:
      if nums[mid] <= target <= nums[high]:
        low = mid + 1
      else:
        high = mid - 1

  return -1