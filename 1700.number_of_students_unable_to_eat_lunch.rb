# 1700.number_of_students_unable_to_eat_lunch.rb
#
# approach: Queue and stack
# time:
#       O(n)
# space:
#       O(1)
#       Questionable hmmm...
# notes:
#       Don't like this solution since we use a loop and it does not break unless
#       one of the two conditions is full filled. After looking at the solution
#       still don't quite understand this.
#
# @param {Integer[]} students
# @param {Integer[]} sandwiches
# @return {Integer}
def count_students(students, sandwiches)
    picky_count = 0

    loop do
        if q_peek(students) == s_top(sandwiches)
            picky_count = 0
            take_sandwich(students, sandwiches)
        else
            picky_count += 1
            next_student(students)
        end

        return students.length if picky_count > students.length
        return 0 if students.empty?
    end
end

# Actions
def take_sandwich(students, sandwiches)
    dequeue(students)
    pop(sandwiches) 
end

def next_student(students)
    enqueue(students, dequeue(students))
end

# Queue operations on array
def enqueue(array, element)
    array.push(element)
end

def dequeue(array)
   array.shift
end

def q_peek(array)
    array[0]
end

# Stack operations on array
def s_top(array)
    array[0]
end

def push(array, element)
    array.unshift(element)
end

def pop(array)
    array.shift
end

##############################################################################################################
# @param {Integer[]} students
# @param {Integer[]} sandwiches
# @return {Integer}
def count_students(students, sandwiches)
    picky_count = 0

    while picky_count <= students.length
        if q_peek(students) == s_top(sandwiches)
            picky_count = 0
            take_sandwich(students, sandwiches)
        else
            picky_count += 1
            next_student(students)
        end

        return 0 if students.empty?
    end
    students.length
end