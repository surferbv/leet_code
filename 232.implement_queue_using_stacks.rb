=begin

    232. Implement Queue using Stacks

    links:
        https://leetcode.com/problems/implement-queue-using-stacks/description/

    approach:
        push O(1) pop amortized O(1) approach

    time: 
        push: O(1)
        pop: O(1) amortized
        empty: O(1)
        peek: O(1)

    space:
        push: O(n)
        pop: O(1)
        empty: O(1)
        peek: O(1)

    note:
        Holding the front at @front is useful. I sill need to do this one again. 

    til:
        Still don't understand much about amortized O(1) time

=end
# Your MyQueue object will be instantiated and called as such:
# obj = MyQueue.new()
# obj.push(x)
# param_2 = obj.pop()
# param_3 = obj.peek()
# param_4 = obj.empty()
class MyQueue
    def initialize()
        @s1     = [] # this stack will be the temp queue
        @s2     = [] # this stack will be the queue
        @front  = nil
    end

=begin
    :type x: Integer
    :rtype: Void
=end
    def push(x)
       if @s1.empty?
        @front = x
       end
       @s1.push( x )
    end

=begin
    :rtype: Integer
=end
    def pop()
        if @s2.empty?
            while !@s1.empty?
                @s2.push( @s1.pop() )
            end
        end  
        return @s2.pop()
    end


=begin
    :rtype: Integer
=end
    def peek()
        if !@s2.empty?
            return @s2[-1]
        end
        return @front
    end


=begin
    :rtype: Boolean
=end
    def empty()
       return @s1.empty? && @s2.empty?
    end

end
