class MinStack
    def initialize()
       @stack = []
       @min   = [] 
    end


=begin
    :type val: Integer
    :rtype: Void
=end
    def push(val)
        @stack.push(val)
        cur_min = if @min[-1].nil? 
                        val
                    else
                        [@min[-1], val].min
                    end
        @min.push(cur_min)
    end


=begin
    :rtype: Void
=end
    def pop()
        @stack.pop()
        @min.pop()
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
        @min[-1]
    end
end

# Your MinStack object will be instantiated and called as such:
# obj = MinStack.new()
# obj.push(val)
# obj.pop()
# param_3 = obj.top()
# param_4 = obj.get_min()