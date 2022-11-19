# 155.min_stack.rb
# https://leetcode.com/problems/min-stack/
# https://youtu.be/qkLl7nAwDPo
#
=begin

    two stack approach

    time: O(1)
        For push, pop, top, and get_min

    space: O(n)
        Still have to store all n items in stack plus n current mins in second stack. 

    note:
        I did it first using a hash use two stacks instead. One for the actually stack and one for the current min which will be on the top. 

=end
class MinStack
    def initialize()
        @stack      = []
        @min_stack  = [] # holds the current min
    end


=begin
    :type val: Integer
    :rtype: Void
=end
    def push(val)
        @stack.push(val)
        val = [@min_stack[-1].nil? ? val : @min_stack[-1], val].min
        @min_stack.push(val)
    end


=begin
    :rtype: Void
=end
    def pop()
        @stack.pop()
        @min_stack.pop()
    end


=begin
    :rtype: Integer
=end
    def top()
        @stack[-1]
    end


=begin
    :rtype: Integer
=end
    def get_min()
        @min_stack[-1]
    end

end

# Your MinStack object will be instantiated and called as such:
# obj = MinStack.new()
# obj.push(val)
# obj.pop()
# param_3 = obj.top()
# param_4 = obj.get_min()


=begin

    stack and hash approach (TLE)

    time: O(1) for push, pop, and top but not get_min O(n)

    space: O(n)

    note:
        This appraoch will TLE
        That still have to iterate over the keys in the hash to find the min.
        A follow up might be to use a heap or sorted array to store the min. 
                
=end
class MinStack
    def initialize()
        @stack   = []
        @hash    = {}
    end


=begin
    :type val: Integer
    :rtype: Void
=end
    def push(val)
        @stack.push(val)
        
        if @hash[val]
            @hash[val] += 1
        else
            @hash[val] = 1
        end   

    end


=begin
    :rtype: Void
=end
    def pop()
        val = @stack.pop() 

        if @hash.key?(val)
            @hash[val] -= 1
            @hash.delete(val) if @hash[val] == 0
        end

    end


=begin
    :rtype: Integer
=end
    def top()
        @stack[-1]
    end


=begin
    :rtype: Integer
=end
    def get_min()
        @hash.min[0]       
    end

end

# Your MinStack object will be instantiated and called as such:
# obj = MinStack.new()
# obj.push(val)
# obj.pop()
# param_3 = obj.top()
# param_4 = obj.get_min()

