# approach: 
# time: O(nlogn + n) = O(nlogn) Since we have to sort and then iterate through the array
# space: O(n) we are using the teams array to store the teams
# technique:
#           The idea is to realize that after sorting the skills array allows us to
#           group the players by skill level since we need to match the weatest player with the strongest player 
#           If you don't do this the there's no way to ensure that the teams skill will be evenly matched. 
#           
#           After this we group the players in groups of two since we are guaranteed that the number of players is even
#           and then we can calculate the sum of the chemestry of each team with checks in mind. 
# notes:
#       Could not figure this out the tricks was that sorting the array allows us to group the players by skill level
#       and determine if we can have even skill.
# @param {Integer[]} skill
# @return {Integer}
def divide_players(skill)

    # sort the array nlogn
    skill.sort! 

    # find the min_diff
    min_diff = skill.last - skill.first

    # group the players by skill level 
    # this would be the strongest player and the weakest player
    weakest = 0 
    strongest = skill.length - 1
    teams = []
    skill_each_team = 0

    while weakest < strongest
        teams << [skill[weakest], skill[strongest]]
        weakest += 1
        strongest -= 1
    end

    # the skill of each team
    skill_each_team = teams.first.first + teams.first.last

    # if there's only one team then we return the sum of the chemestry
    return teams.first.first * teams.first.last if teams.length == 1

    # if the skill of each times do not match then we return -1
    return -1 if teams.any? { |team| team.first + team.last != skill_each_team}

    # return the sum of the chemestry
    sum = 0
    teams.each { |team| sum += team.first * team.last }

    # return the sum of the chemestry
    sum
end