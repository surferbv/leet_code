# 408.valid_word_abbreviation.rb
# @param {String} word
# @param {String} abbr
# @return {Boolean}
#
# appraoch: two pointers
# time: O(n) = O(n + m) n is the length of the word and m is the length of the abbr but in the worst case, m = n so O(n)
# space: O(1) no extra space
# notes:
# This probelm has a lot of edges cases to consider
# First outter condition is to check if both the word and abbr are not at the end, return false
# 1. if the first digit is 0, return false as it's not a valid abbreviation
#  1.1 if the first digit is not 0, we need to move the word pointer forward by steps
# 2. if the word and abbr don't match, return false
#  2.1 if the word and abbr match, move both pointers forward
# 3. if both the word and abbr are not at the end, return false
def valid_word_abbreviation(word, abbr)
  wrd_idx = abr_idx = 0
  while wrd_idx < word.length && abr_idx < abbr.length
    if abbr[abr_idx] =~ /[0-9]/ # if it's a digit
      steps = 0  # how many steps to move forward initially it's 0

      return false if abbr[abr_idx] =~ /0/ # if the first digit is 0, return false as it's not a valid abbreviation

      while abr_idx < abbr.length && abbr[abr_idx] =~ /[0-9]/
        steps = steps * 10 + abbr[abr_idx].to_i # why 10 ? This is the way to convert steps to integer base 10
        abr_idx += 1
      end

      wrd_idx += steps # move the word pointer forward by steps

    else
      return false if word[wrd_idx] != abbr[abr_idx] # if the word and abbr don't match, return false 
      wrd_idx += 1
      abr_idx += 1
    end
  end

  return wrd_idx == word.length && abr_idx == abbr.length # if both the word and abbr are not at the end, return false
end