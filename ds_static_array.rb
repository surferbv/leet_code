# ds_static_array.rb

class StaticArray

    attr_accessor :length, :capacity, :array

    def initialize(length)
        @length     = length
        @capacity   = 0
        @array      = Array.new(length) # note empty slots will have nil
    end

    def insert_end(n)
        if is_full?
            puts "Array has reached capacity!"
        else
            @array[@length - 1] = n 
            @capacity += 1
            
        end
    end

    def remove_end()
         if @array[@length - 1]
            @array[@length - 1] = nil
         else
            puts "Nothing to remove"
         end
    end

    def insert_at_i(i, n)
        (@length - 1).downto(i - 1) do |j|
            @arry[j + 1] = @arry[j]
        end
        @arry[i] = n
    end

    def remove_at_i(i)
        for j in (i + 1..@length - 1) do
            @arry[j - 1] = @arry[j]
        end
    end

    def print_it()
        print @array
        puts
    end

    def is_full?()
        return @capacity == @length
    end

end

# test cases

my_array = StaticArray.new(3)

puts "Capacity and length should be 3"
puts "expect false: #{my_array.capacity == my_array.length}"
puts
puts "Expect length and capacity to be 3"
puts "capacity: 0 == #{my_array.capacity}"
puts "length: 3 == #{my_array.length}"
puts
puts "Should not be full"
puts "expect false: #{my_array.is_full?}"
puts 
puts "Print array:"
my_array.print_it()
puts
puts "Insert at end:"
my_array.insert_end(1)
my_array.print_it
puts
puts "Insert at end:"
my_array.insert_end(2)
my_array.print_it
puts

