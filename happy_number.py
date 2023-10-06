# happy_number.py

# algorithm:
# 1. Initialize a variable slow to the input number and fast with the sume of the squared inmput number
# 2. If fast is not 1 and also not equal to slow, increment slow by one iteration and fast by two iterations. 
#    Essentially, set slow to the Sum of Squared Digits(Sum of Squard Digits(fast)).
# 3. If fast converges to 1, return TRUE, otherwise return FALSE.

def is_happy_number(n):
    slow = n
    fast = sum_of_squared_digits(n)
    while fast !=1 and fast != slow:
        slow = sum_of_squared_digits(slow)
        fast = sum_of_squared_digits(sum_of_squared_digits(fast))
    
    return fast == 1 

def sum_of_squared_digits(n):
    sum = 0
    while n > 0: 
        digit = n % 10
        sum += digit**2
        n //= 10
    
    return sum
