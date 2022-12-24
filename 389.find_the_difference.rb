=begin

    title:
        389. Find the Difference (easy)

    links:
        https://leetcode.com/problems/find-the-difference/description/

    approach:
        hash approach 

    time: O(n)

    space: O(1) 
        Since we can hold at most 26 characters.

    note:
        You can solve this using a hash and still consider it constant space if the hash
        holds a constant number of values

    til:
        You can not simple compare characters because of the shuffling.
        typing include? 3 is not the same as include?(3) be explicit. 

    results:
        Runtime 111 ms Beats 82.14% Memory 211.1 MB Beats 32.14%

=end
# @param {String} s
# @param {String} t
# @return {Character}
def find_the_difference(s, t)
    counter_s = Hash.new(0)

    s.chars.each do |c|
        counter_s[c] += 1
    end 

    print counter_s

    t.chars.each do |c|
        puts c
        # iterate throught the hash to find the char that are not in s
        if !counter_s.include?(c) || counter_s[c] == 0
            return c 

        # to eliminate the possibility of a false match later
        else
            counter_s[c] -= 1
        end
    end
end