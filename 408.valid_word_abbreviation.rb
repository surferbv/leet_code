# 408.valid_word_abbreviation.rb
# @param {String} word
# @param {String} abbr
# @return {Boolean}
def valid_word_abbreviation(word, abbr)
  l = r = 0
  while l < word.length && r < abbr.length
    if abbr[r] =~ /[0-9]/
      steps = abbr[r].to_i
      return false if steps == 0

      while r < abbr.length && abbr[r] =~ /[0-9]/
        steps = steps * 10 + abbr[r].to_i # why 10 ? because it's a decimal system
        r += 1
      end

      steps.times do
        l += 1
      end

      return false if l > word.length
    else
      return false if word[l] != abbr[r]
      l += 1
      r += 1
    end
  end

  return l == word.length && r == abbr.length
end