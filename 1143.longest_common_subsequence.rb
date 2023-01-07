=begin

    title:
        1143. Longest Common Subsequence

    links:
        https://leetcode.com/problems/longest-common-subsequence/
        https://www.youtube.com/watch?v=Ua0GhsJSlWM

    approach:

    time:

    space:

    note:

    til:

    results:

=end
# @param {String} text1
# @param {String} text2
# @return {Integer}
def longest_common_subsequence(text1, text2)
    dp = Array.new(text1.length + 1, Array.new(text2.length + 1, 0))
    for i in (text1.length - 1).downto(0)
        for j in (text2.length - 1).downto(0)
            if text1[i] == text2[j]
                dp[i][j] = 1 + dp[i + 1][j + 1]
            else
                dp[i][j] = [dp[i][j + 1], dp[i + 1][j]].max
            end
        end
    end

    return dp[0][0]
end