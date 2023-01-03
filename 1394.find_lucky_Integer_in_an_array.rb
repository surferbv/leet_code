=begin

    title:
        1394. Find Lucky Integer in an Array (easy)

    links:
        https://leetcode.com/problems/find-lucky-integer-in-an-array/

    approach:
        counter or hash approach

    time: O(n)
        Inserting takes O(1) * O(n) hence O(n) and iterating over the hash
        will also take O(n) thus O(n) + O(n) = O(2n) = O(n)

    space: O(n)
        In the worst case all the values in arr are you unique.  

    note:
        Three approaches 1. brute foce, 2. sorting and using streak and 
        3. is counting or hash appraoch.  

        Interesitng approach
        {1 => 1, 2 => 2, 3 => 4}.select(&:==) => {1=>1, 2=>2}
        nums.tally.select(&:==).keys.push(-1).max


    til:
        You can sort the array and keep track of the streak to determine
        if its value matches the occurance. 

    results:
        Runtime 154 ms Beats 50% Memory 211.5 MB Beats 100%

=end
# @param {Integer[]} arr
# @return {Integer}
def find_lucky(arr)
    lucky_number = -1

    hash = Hash.new(0)

    arr.each{ |n| hash[n] += 1  }

    hash.each{ |k, v| 
        if k == v 
            lucky_number = [lucky_number, k].max
        end
    }

    return lucky_number
end