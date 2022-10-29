#1672. Richest Customer Wealth
# @param {Integer[][]} accounts
# @return {Integer}
#
# rubyish way
# 
# time: O(m x n) If we have m customers with n accounts we would have to go
#       m x n of them in the worst case to find the wealthiest customer.
#
# space: O(1) we don't allocated any additional data structures. 
def maximum_wealth(accounts)
    most_wealth = 0

    accounts.each do |account|
        wealth = account.reduce(:+)
        most_wealth = wealth if wealth > most_wealth
    end

    return most_wealth
end

# iterative way
# 
# time: O(m x n) 
# space: O(1) 
def maximum_wealth(accounts)
    most_wealth = 0

    accounts.each do |account|
        customer_wealth = 0

        account.each do |balance|
            customer_wealth += balance
        end

        most_wealth = wealth if wealth > most_wealth
    end

    return most_wealth
end

# one-liner way
# 
# time: O(m x n) 
# space: O(1) 
def maximum_wealth(accounts)
    accounts.map {|account| account.sum }.max
end