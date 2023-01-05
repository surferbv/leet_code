=begin

    title:  
        1360. Number of Days Between Two Dates (easy)

    links:
        https://leetcode.com/problems/number-of-days-between-two-dates/

    approach:
        date approach

    time: ?

    space: ?

    note:
        The approach is the first find the number or days for 
        each date from epoch and then with those results 
        take the difference to find the number of days. In this case
        we convert them to seconds and the back to days 

    til:
        Can this be done faster by not using built in library ? 

    results:
        Runtime 163 ms Beats 25% Memory 211.3 MB Beats 25%

=end
# @param {String} date1
# @param {String} date2
# @return {Integer}
require 'date'
def days_between_dates(date1, date2)
    date1 = Date.parse(date1).to_time.to_i
    date2 = Date.parse(date2).to_time.to_i
    (date2 - date1).abs / (60*60*24)
end
