
# algorithm: binary search
# 1. Find the middle element in the sorted array
# 2. Compare the middle element with the target element. If it matches return the index of the middle element
# 3. If the target is smaller than the middle element, performed the search on the left half of the array. Otherwise, perform the search on the right half of the array
# 4. Repeat the process until the target value is found. Otherwise, return -1 if not found

def binary_search(nums, target):
    left = 0
    right = len(nums) - 1

    while left <= right:
        mid = (left + right) // 2

        if nums[mid] == target:
            return mid
        elif target < nums[mid]:
            right = mid - 1
        else:
            left = mid + 1
    
    return -1


# educative version
def binary_search(nums, target):
    low = 0
    high = len(nums) - 1
    
    while low <= high:
        # Finding the mid using floor division
        mid = low + ((high - low) // 2)
        
        # Target value is present at the middle of the array
        if nums[mid] == target:
            return mid
        
        # Target value is present in the low subarray
        elif target < nums[mid]:
            high = mid - 1
        
        # Target value is present in the high subarray
        elif target > nums[mid]:
            low = mid + 1

    # Target value is not present in the array	
    return -1


def main():
    nums_lists = [
        [], 
        [0, 1],
        [1, 2, 3], 
        [-1, 0, 3, 5, 9, 12], 
        [-100, -67, -55, -50, -49, -40, -33, -22, -10, -5]
      ]
    target_list = [12, 1, 3, 9, -22]

    for i in range(len(nums_lists)):
        nums = nums_lists[i]
        target = target_list[i]
        index = binary_search(nums, target)

        print(i+1, ".\tArray to search: ", nums, sep="")
        print("\tTarget: ", target, sep="")

        if index != -1:
            print("\t", target, " exists in the array at index ", index, sep="")
        else:
            print("\t", target, " does not exist in the array so the return value is ", index, sep="")
        print('-' * 100)


if __name__ == '__main__':
		main()