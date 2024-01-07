# 446. Arithmetic Slices II - Subsequence
# param {Integer[]} nums
def number_of_arithmetic_slices(nums)
  n = nums.length
  ans = 0
  cnt = Array.new(n) { Hash.new(0) }

  (0...n).each do |i|
    cnt[i] = {}
    (0...i).each do |j|
      delta = nums[i].to_i - nums[j].to_i
      if delta < -Float::INFINITY || delta > Float::INFINITY
        next
      end

      diff = delta.to_i
      sum = cnt[j][diff] || 0
      origin = cnt[i][diff] || 0
      cnt[i][diff] = origin + sum + 1
      ans += sum
    end
  end

  ans
end




