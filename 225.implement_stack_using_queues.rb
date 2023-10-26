# 225. Implement Stack using Queues
# attempt: 2
# appraoch: using one queue 
# time:
#       push: O(n)    n = number of elements in stack
#       pop: O(1)
#       top: O(1)
#       empty: O(1)
#
# space:
#       O(n)    n = number of elements in stack
# notes:
#       neetcode appraoch
class MyStack
    def initialize()
        @q = Array.new() 
    end


=begin
    :type x: Integer
    :rtype: Void
=end
    def push(x)
        @q.push(x)
    end


=begin
    :rtype: Integer
=end
    def pop()
        # we do - 1 because we want to stop at the second to last element in the queue as this would be the top of the stack
        (@q.size - 1).times do
            @q.push(@q.shift)
        end

        return @q.shift
    end


=begin
    :rtype: Integer
=end
    def top()
        @q.last
    end


=begin
    :rtype: Boolean
=end
    def empty()
        @q.empty?
    end
end

# Your MyStack object will be instantiated and called as such:
# obj = MyStack.new()
# obj.push(x)
# param_2 = obj.pop()
# param_3 = obj.top()
# param_4 = obj.empty()


##############################################################
# attempt: 1
# appraoch: using two queues
# time: O(n)    n = number of elements in stack
# space: O(n)   n = number of elements in stack
# notes:
#       Was not able to impelment this using two queues.
class MyStack
    def initialize()
        @top = nil
        @q1 = Queue.new 
        @q2 = Queue.new
    end


=begin
    :type x: Integer
    :rtype: Void
=end
    def push(x)
        @top = x
        if @q1.empty?
            @q1.enq(@top)
        else
            while !@q1.empty?
                x = @q1.deq
                @q2.enq(x)
            end
            @q2.enq(@top)
        end
    end


=begin
    :rtype: Integer
=end
    def pop()
        if !@q1.empty?
            return @q1.deq
        end

        if !@q2.empty?
            while !@q2.empty?
                x = @q2.deq
                @q1.enq(x)
            end
            @top = @q1.deq
            @q1.enq(@top)
        end

        return nil
    end


=begin
    :rtype: Integer
=end
    def top()
        if !@q1.empty?
            top_old = @q1.deq

            while !@q2.empty?
                x = @q2.deq
                @q1.enq(x)
            end

            @top = @q1.deq

            while !@q1.empty?
                x = @q1.deq
                @q2.enq(x)
            end

            return top_old
        end

        return nil
    end


=begin
    :rtype: Boolean
=end
    def empty()
       @q1.closed? && @q2.closed? 
    end
end

# Your MyStack object will be instantiated and called as such:
# obj = MyStack.new()
# obj.push(x)
# param_2 = obj.pop()
# param_3 = obj.top()
# param_4 = obj.empty()