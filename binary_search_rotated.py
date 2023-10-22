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


  # educative appraoch
  # iterative
  def binary_search_rotated(nums, target):
    low = 0
    high = len(nums) - 1

    if low > high:
        return -1

    while low <= high:
        mid = low + (high - low) // 2
        if nums[mid] == target:
            return mid

        if nums[low] <= nums[mid]:
            if nums[low] <= target and target < nums[mid]:
                high = mid - 1 
            else:
                low = mid + 1 
        else:
            if nums[mid] < target and target <= nums[high]:
                low = mid + 1
            else:
                high = mid - 1 
    return -1


def main():
    nums_list = [[5, 6, 7, 1, 2, 3, 4],
                 [40, 50, 60, 10, 20, 30],
                 [47, 58, 69, 72, 83, 94, 12, 24, 35], 
                 [77, 82, 99, 105, 5, 13, 28, 41, 56, 63], 
                 [48, 52, 57, 62, 68, 72, 5, 7, 12, 17, 21, 28, 33, 37, 41]]

    target_list = [1, 50, 12, 56, 5]

    for i in range(len(target_list)):
        print((i + 1), ".\tRotated array: ", nums_list[i], "\n\ttarget", target_list[i], "found at index ", \
              binary_search_rotated(nums_list[i], target_list[i]))
        print("-"*100)


if __name__ == '__main__':
    main()

# recursivae appraoch 
def binary_search(nums, low, high, target):

    if (low > high):
        return -1
    mid = low + (high - low) // 2

    if nums[mid] == target:
        return mid

    if nums[low] <= nums[mid]:
        if nums[low] <= target and target < nums[mid]:
            return binary_search(nums, low, mid-1, target)
        return binary_search(nums, mid+1, high, target)
    else:
        if nums[mid] < target and target <= nums[high]:
            return binary_search(nums, mid+1, high, target)
        return binary_search(nums, low, mid-1, target)


def binary_search_rotated(nums, target):
    return binary_search(nums, 0, len(nums)-1, target)


def main():
    nums_list = [[5, 6, 7, 1, 2, 3, 4],
                 [40, 50, 60, 10, 20, 30],
                 [47, 58, 69, 72, 83, 94, 12, 24, 35], 
                 [77, 82, 99, 105, 5, 13, 28, 41, 56, 63], 
                 [48, 52, 57, 62, 68, 72, 5, 7, 12, 17, 21, 28, 33, 37, 41]]

    target_list = [1, 50, 12, 56, 5]

    for i in range(len(target_list)):
        print((i + 1), ".\tRotated array: ", nums_list[i], "\n\ttarget", target_list[i], "found at index ", \
              binary_search_rotated(nums_list[i], target_list[i]))
        print("-" * 100)


if __name__ == '__main__':
    main()
