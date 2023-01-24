=begin

    title:
        997. Find the Town Judge (easy)

    links:
        https://leetcode.com/problems/find-the-town-judge/

    approach:
        two arrays appraoch

    time: O(E)

    space: O(N)

    note:
        a judge is a i such that it has n - 1 in degrees and 0 out degrees. 

    til:
        in degree and out degree. This can also be solved with on array. 

    results:
        Runtime 137 ms Beats 93.55% Memory 213 MB Beats 35.48%

=end
# @param {Integer} n
# @param {Integer[][]} trust
# @return {Integer}
def find_judge(n, trust)
    return -1  if trust.length < n - 1

    in_degree = [0] * (n + 1)
    out_degree = [0] * (n + 1)

    trust.each do |a, b|
        out_degree[a] += 1
        in_degree[b] += 1
    end

    (1..n+1).each do |i|
        return i if in_degree[i] == n - 1 && out_degree[i] == 0
    end
    
    return -1
end