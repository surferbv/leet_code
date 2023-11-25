# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
    buy = 0 
    max_profit = 0

    (1..prices.length - 1).each do |i|
        if prices[buy] < prices[i]
            profit = prices[i] - prices[buy]
            max_profit = [profit, max_profit].max # goofed here did use = sign 
        else
            buy = i # goofed here should have jumped forward 
        end
    end

    max_profit 
end