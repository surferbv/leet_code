# 451. Sort Characters By Frequency (medium)
# https://leetcode.com/problems/sort-characters-by-frequency/description/
# @param {String} s
# @return {String}
=begin

    hash approach
    
    time:(n log n)
        Since we still need to sort our hash based on values. 

    space: O(n)
        The worst case we have to store all characters in the hash and build a new string
        were the occurrences are the same or all. 

    note:
        This uses a hash to keep track of the occurrences of the each character. 
        Each character is the key and its occurrence as the value.

=end
def frequency_sort(s)
    hash = Hash.new(0)
    string = ""

    s.chars.each do |c|
        hash[c] += 1
    end

    hash.sort_by{|k,v| -v}.each do |arr|
        arr[1].times do
            string << arr[0]
        end
    end

    return string   
end


# NOT ME LIKE TO STUDY THIS LATER
# @param {String} s
# @return {String}
def frequency_sort(s)
    s.chars.tally.sort_by(&:last).reverse.map {|key, value| key * value}.join
  end