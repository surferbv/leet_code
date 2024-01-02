# notes:
# 1. use two pointers to iterate through g and s
# 2. if g[i] <= s[j], then i++, j++
# 3. if g[i] > s[j], then j++
# 4. return i at the end
# 
# time: O(nlogn + mlogm 
# space: O(m + n) or O(logm + logn) if we sort in place
#
# @param {Integer[]} g
# @param {Integer[]} s
# @return {Integer}
def find_content_children(g, s)
  g.sort!
  s.sort!

  i = 0
  j = 0
  while i < g.length && j < s.length
    if g[i] <= s[j]
      i += 1
    end
    j += 1
  end

  i
end