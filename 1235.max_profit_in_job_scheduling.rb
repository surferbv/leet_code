# 1235. Maximum Profit in Job Scheduling
def find_next_job(start_time, last_ending_time)
  start_idx = 0
  end_idx = start_time.length - 1
  next_index = start_time.length

  while start_idx <= end_idx
    mid = (start_idx + end_idx) / 2

    if start_time[mid] >= last_ending_time
      next_index = mid
      end_idx = mid - 1
    else
      start_idx = mid + 1
    end
  end

  next_index
end

def find_max_profit(jobs, start_time)
  length = start_time.length
  memo = Array.new(length, 0)

  (length - 1).downto(0) do |position|
    # it is the profit made by scheduling the current job
    curr_profit = 0

    # next_index is the index of the next non-conflicting job
    next_index = find_next_job(start_time, jobs[position][1])

    # if there is a non-conflicting job possible, add its profit
    # else just consider the current job profit
    if next_index != length
      curr_profit = jobs[position][2] + memo[next_index]
    else
      curr_profit = jobs[position][2]
    end

    # storing the maximum profit we can achieve by scheduling
    # non-conflicting jobs from index position to the end of array
    if position == length - 1
      memo[position] = curr_profit
    else
      memo[position] = [curr_profit, memo[position + 1]].max
    end
  end

  memo[0]
end

def job_scheduling(start_time, end_time, profit)
  jobs = []

  # storing job's details into one list
  # this will help in sorting the jobs while maintaining the other parameters
  length = profit.length
  (0...length).each do |i|
    curr_job = [start_time[i], end_time[i], profit[i]]
    jobs << curr_job
  end

  jobs.sort! { |a, b| a[0] <=> b[0] }

  # binary search will be used in startTime so store it as a separate list
  start_time = jobs.map { |job| job[0] }

  find_max_profit(jobs, start_time)
end
