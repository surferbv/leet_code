# approach: two pointers
# time: O(nlogn) where n is the length of the intervals array
# space: O(n) we are using two arrays to store the start and end times
# notes:
#       The take away here is to
#       1. use two pointers 
#       2. sort the start and end times arrays
#       3. iterate through the start times and end times arrays this simulates time moving forward and 
#          we can compare the start and end times to see if a meeting has ended or started
#       4. if a meeting has started then we need to increment the current count of meetings
#       5. if a meeting has ended then we need to decrement the current count of meetings
#          notice that we did not use a =< because we want to account for the case where a meeting ends and another starts
#          at the same time
#       6. keep track of the max number of meetings
#
#       - Trying drawing this up and placing vertial lines for when a meeting is in session and when it ends
#       - Notice that the number of vertical lines at any given time is the number of meetings in session
#       - Notice that the max number of vertical lines is the max number of meetings in session
# 
# @param {Integer[][]} intervals
# @return {Integer}
def min_meeting_rooms(intervals)
    count           = 0 # hold the max number of meeting rooms 
    cur_count       = 0
    s               = 0 # pointer for start_times array
    e               = 0 
    start_times     = []
    end_times       = []

    intervals.each do |interval| 
        start_times << interval.first
        end_times << interval.last
    end

    start_times.sort!
    end_times.sort!

    while s < start_times.length 
        if start_times[s] < end_times[e] 
            s += 1
            cur_count += 1
        else # meeting has to end before it starts 
            e += 1
            cur_count -= 1 
        end
        count = [count, cur_count].max
    end

   count 
end