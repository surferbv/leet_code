# An analyst is analyzing a stock over a period of n days.
# The price of the stock on the ith day is price[i] and the profit obtained is denoted as profit[i].
# The analyst wants to pick a triplet of days (i, j, k) such that (i < j < k) and price[i] < price[j] < price[k] 
# in such a way that the total profit i.e. profit[i] + profit[j] + profit[k] is maximized.
#
# Find the maximum profit that can be obtained. If there is no valid triplet return -1.
#
# example: 
# consider n = 5, price = [1, 5, 3, 4, 6], profit = [2, 3, 4, 5, 6]
#
# An optimal triplet (considering 1-based indexing) is (3, 4, 5). Here 3 < 4 < 5 and 
# profit[3] + profit[4] + profit[5] = 4 + 5 + 6 = 15 which is the maximum possible profit.
#
# Function Description
# Complete the function getMaximumProfit in the editor below.
#
# getMaximumProfit has the following parameter(s):
#    int price[n]:  the price of the stock on each day
#    int profit[n]: the profit obtained on each day
#
# Returns:
#    int: the maximum profit that can be obtained. If there is no valid triplet return -1.
#
# Constraints
# 1 <= n <= 4000
# 1 <= price[i], profit[i] <= 10^9
#
# @param {Integer[]} price
# @param {Integer[]} profit
# @return {Integer}
def get_maximum_profit(price, profit)
    # create a hash of the prices and profits
    # key: price
    # value: profit
    hash = {}
    price.each_with_index do |price, index|
        hash[price] = profit[index]
    end

    puts "hash: #{hash}"

    # sort the prices
    # why do we need to sort the prices?
    # because we need to find the next three prices in order
    prices = hash.keys.sort

    # iterate through the prices and find the max profit
    max_profit = -1
    prices.each_with_index do |price, index|
        # find the next two prices
        next_prices = prices[index..index+2]
        next_prices.each do |next_price|
            # find the next profit
            next_profit = hash[next_price]
            # find the total profit
            total_profit = hash[price] + next_profit
            # update the max profit
            max_profit = total_profit if total_profit > max_profit
        end
    end

    # return the max profit
    max_profit
end

# This is the same but we want to pick a triplet of days (i, j, k) such that (i < j < k) and price[i] < price[j] < price[k]
def get_maximum_profit(price, profit)

    hash = {}
    price.each_with_index do |price, index|
        hash[price] = profit[index]
    end

    prices = hash.keys.sort

    max_profit = -1

    prices.each_with_index do |price, index| 
        next_prices = prices[index..index+2]
        next_prices.each do |next_price|
            next_profit = hash[next_price]
            total_profit = hash[price] + next_profit
            max_profit = total_profit if total_profit > max_profit
        end
    end

    max_profit
end