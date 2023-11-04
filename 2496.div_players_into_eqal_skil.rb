# approach: 
# time:
# space:
# technique:
# notes:
#       The overall idea is to sort the array and then find the smallest difference between 
#       the strongest player and the weakest player
#       and then find the number of players that have the same skill level as the weakest player
#       and then divide the number of players by the min_diff to get the number of teams
#       and then we need to get the sum of the chemestry of all the teams
#       and then we can return the sum of the chemestry
# @param {Integer[]} skill
# @return {Integer}
def divide_players(skill)

    # sort the array this will place the weakest player with the strongest player
    skill.sort!

    # we want to find the smallest difference between the strongest player and the weakest player
    # we can do this by iterating through the array and comparing the current player to the next player
    min_diff = Float::INFINITY

    (0...skill.length-1).each do |i|
        min_diff = [min_diff, skill[i+1] - skill[i]].min
    end

    # now we want to find the number of players that have the same skill level as the weakest player
    # we can do this by iterating through the array and comparing the current player to the weakest player
    count = 0

    skill.each do |s|
        count += 1 if s == skill.first
    end

    # we can divide the number of players by the min_diff to get the number of teams
    # we can use integer division to get the number of teams
    # if the min_diff is 0 then we can just return the number of players
    min_diff == 0 ? count : count / min_diff

    # if the min_diff is not 0 then we the skills of each team is not equal so return -1
    # the skills of each team is equal so we return -1
    return -1 if min_diff != 0

    # we need to get the sum of the chemestry of all the teams
    # we can do this by iterating through the array and adding the min_diff to the weakest player
    # use two pointers to keep track of the weakest player and the strongest player to get the sum of the chemestry
    sum = 0
    l = 0
    r = skill.length - 1

    while l < r
        sum += skill[l] * skill[r] 
        l += 1
        r -= 1
    end

    sum 
end