# @param {String[]} bank
# @return {Integer}
def number_of_beams(bank)
  prev = 0
  ans = 0

  bank.each do |s|
    count = 0
    s.each_char do |char|
      count += 1 if char == '1'
    end

    if count > 0
      ans += prev * count
      prev = count
    end
  end

  ans
end