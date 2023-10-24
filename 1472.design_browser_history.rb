# 1472.design_browser_history.rb
# initial appraoch does not work because we are not clearing the history for visit actions
class BrowserHistory
    class ListNode
        attr_accessor :val, :next, :prev
        def initialize(_val = "")
            @val = _val
            @next = nil
            @prev = nil
        end
    end

=begin
    :type homepage: String
=end
    def initialize(homepage)
       @left =  ListNode.new()
       @right = ListNode.new()
       homepage = ListNode.new(homepage)
       @curr = homepage

       @left.next = homepage 
       homepage.prev = @left
       homepage.next = @right
       @right.prev = homepage
    end

=begin
    :type url: String
    :rtype: Void
=end
    def visit(url)
        new_page = ListNode.new(url)
        @curr = new_page
        _next = @left.next

        # we need to clear the forward history if @left.next != nil (that is the list is not empty

        @left.next = new_page
        new_page.prev = @left
        new_page.next = _next
        _next.prev = new_page
    end


=begin
    :type steps: Integer
    :rtype: String
=end
    def forward(steps)
        steps.times do
            if @curr && @curr.prev != @left
                @curr = @curr.prev
            else
                break
            end
        end
        @curr.val
    end


=begin
    :type steps: Integer
    :rtype: String
=end
    def back(steps)
        steps.times do
            if @curr && @curr.next != @right
                @curr = @curr.next
            else
                break
            end
        end
        @curr.val
    end
end
    
    # Your BrowserHistory object will be instantiated and called as such:
    # obj = BrowserHistory.new(homepage)
    # obj.visit(url)
    # param_2 = obj.back(steps)
    # param_3 = obj.forward(steps)

# ###########################################
# 1472.design_browser_history.rb
# appraoch: doubly linked list
# time: O(n)
# space: O(n)
# note: Similar to neetcode.io appraoch  
class BrowserHistory
    class ListNode
        attr_accessor :val, :next, :prev
        def initialize(_val = "", prev = nil, _next = nil)
            @val = _val
            @next = _next 
            @prev = prev 
        end
    end

=begin
    :type homepage: String
=end
    def initialize(homepage)
        @cur = ListNode.new(homepage)
    end


=begin
    :type url: String
    :rtype: Void
=end
    def visit(url)
        @cur.next = ListNode.new(url, @cur)
        @cur = @cur.next
    end


=begin
    :type steps: Integer
    :rtype: String
=end
    def back(steps)
        steps.times do 
            if @cur.prev
                @cur = @cur.prev
            else
                break
            end
        end
        @cur.val
    end


=begin
    :type steps: Integer
    :rtype: String
=end
    def forward(steps)
        steps.times do 
            if @cur.next
                @cur = @cur.next
            else
                break
            end
        end
        @cur.val
    end
end

# Your BrowserHistory object will be instantiated and called as such:
# obj = BrowserHistory.new(homepage)
# obj.visit(url)
# param_2 = obj.back(steps)
# param_3 = obj.forward(steps)
