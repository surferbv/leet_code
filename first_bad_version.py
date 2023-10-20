from api import *

version_api = api(0)

def is_bad_version(v):
    return version_api.is_bad(v)

# approach: binary search
# time: O(log n)
# space: O(1)

# algorithm:
# 1. initilize first to 1 and last to n.
# 2. calculate mid as the mean of 1 and n and call the API with mid. Increment the counter of the number of API calls.
# 3. if the API function returns TRUE, set last to mid.
# 4. else, if the API function returns FALSE, set first to mid + 1.
# 5. while first < last, repeat the steps to adjust first and last, to recalculate mid and to call the API function.
# 6. return the tuple containing the first bad version and the number of API calls. 
def first_bad_version(n):
# -- DO NOT CHANGE THIS SECTION
    version_api.n = n
# -- 

    first = 1
    last = n 
    calls = 0

    while first < last:
        mid = (first + last) // 2

        if is_bad_version(mid):
            last = mid
        else:
            first = mid + 1

        calls += 1

    return (first, calls)
