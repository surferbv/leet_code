=begin

    title:
        292. Nim Game (easy)

    links:
        https://leetcode.com/problems/nim-game/

    approach:
        mod 4 approach

    time: O(1)
        We run modulo operation once.     

    space: O(1)
        Not additional space is allocated.

    note:
        Observe that you can win if there are exactly 1, 2, or 3 stones left on the pile.
        If there are 4 stones left on the pile no matter what you choose your opponent will 
        always win. This can be generalized to even n number of stones that are a multiple of 4. 

    til:
        This is a game theory problem which can be proven by induction. 
        https://web.archive.org/web/20150528155700/https://www.cs.umd.edu/~gordon/ysp/nim.pdf
        You can also solve this using DP. 

    results:    
        Runtime 87 ms Beats 57.14% Memory 211 MB Beats 42.86%

=end
# @param {Integer} n
# @return {Boolean}
def can_win_nim(n)
    return n % 4 == 0
end