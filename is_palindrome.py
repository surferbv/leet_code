def is_palindrome(s):
    left = 0
    right = len(s) - 1
    while left <= right:
       if s[left] != s[right]:
          return False
        
       left += 1
       right -= 1
    
    return True 

# solutions from educative.io
def is_palindrome(s):
    print("String to check: ", s, ". Length of string: ", len(s), sep='')
    left = 0
    right = len(s) - 1
    i = 1
    while left < right: # The terminating condition for the loop is when both the pointers reach the same element or when they cross each other.
        print("In iteration ", i, ", left = ", left, ", right = ", right, sep="")
        print("The current element being pointed to by the left pointer is '",
              s[left], "'", sep="")
        print("The current element being pointed to by the right pointer is '",
              s[right], "'", sep="")
        left = left + 1  # Heading towards the right
        right = right - 1  # Heading towards the left
        i = i + 1
        print("-" * 100)
    print("Loop terminated with left = ", left, ", right = ", right, sep="")
    return ("The pointers have either reached the same index, or have crossed each other, hence we don't need to look further.")


# Driver code
def main():
    test_cases = ["RACECAR", "ABBA", "TART"]
    i = 1
    for s in test_cases:
        print("Test Case #", i)
        print(is_palindrome(s))
        print("-" * 100, end="\n\n")
        i = i + 1

if __name__ == '__main__':
    main()

# complete solution from educative.io
def is_palindrome(s):
    left = 0
    right = len(s) - 1
    while left < right:
        if s[left] != s[right]:
            return False
        left = left + 1 
        right = right - 1
    return True


# Driver Code
def main():

    test_cases = ["RACEACAR", "A", "ABCDEFGFEDCBA",
                  "ABC", "ABCBA", "ABBA", "RACEACAR"]
    for i in range(len(test_cases)):
        print("Test Case #", i + 1)
        print("-" * 100)
        print("The input string is '", test_cases[i], "' and the length of the string is ", len(test_cases[i]), ".", sep='')
        print("Is it a palindrome?.....", is_palindrome(test_cases[i]))
        print("-" * 100)


if __name__ == '__main__':
    main()

