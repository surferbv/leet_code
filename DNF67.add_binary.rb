# 67.add_binary.rb
# @param {String} a
# @param {String} b
# @return {String}
#
# one liner
#
# time: O(N + M) since ruby uses an array of *argv 
#       to scan N and M which are the lengths of a and be respectively. 
#
# space: O(1)
def add_binary(a, b)
    (a.to_i(2) + b.to_i(2)).to_s(2)
end


# xor approach
#
# time: O(N+M) where N and M are the lengths of a and b respectivaly. 
#
# space: O(max(N,M)) since we have to keep the result stored. 
def add_binary(a, b)
    x =  a.to_i(2)
    y =  b.to_i(2)

    while y != 0
        result = x ^ y
        carry = (x & y) << 1
        x = result
        y = carry
    end

    return x.to_s(2)
end


# DOES NOT WORK
# iterative approach
#
# time: O(max(N,M)) where N and M are the lengths of a and b respectivaly. 
#
# space: O(1)
def add_binary(a, b)
    n       = [a.length, b.length].max
    a       = "%0#{n}d" % a # padding with zeros
    b       = "%0#{n}d" % b
    carry   = 0
    result  = []

    puts "a: #{a}"
    puts "b: #{b}"

    for i in (0..n) do
        idx = n - 1 - i
        puts "idx: #{idx}"
        carry += 1 if a[i] == '1'
        carry += 1 if b[i] == '1'

        if carry % 2 == 1
            result.push('1')
        else
            result.push('0')
        end
            
        carry /= 2
    end

    result.push('1') if carry == 1

    result.reverse!    

    return result.join('')
end