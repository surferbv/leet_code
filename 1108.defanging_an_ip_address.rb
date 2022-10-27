# @param {String} address
# @return {String}
# 
# gsub approach
# time: O(n) where n is the size of the string. 
# space: O(1) no additional data structures are created.
def defang_i_paddr(address)
    address.gsub '.', '[.]'
end

# regex approach
# time: O(n) where n is the size of the string. 
# space: O(1) no additional data structures are created.
def defang_i_paddr(address)
    address.gsub /\./, '[.]'
end

# iterative approach
# time: O(n) still have to iterate over all n characters of the string.
# space: O(n) we are returning a new array of size n.
def defang_i_paddr(address)
    defang_ip_addr = ""
    
    address.split("").each do |c|
        if c == "." 
            defang_ip_addr << "[.]" 
        else
            defang_ip_addr << c
        end
    end

    return defang_ip_addr
end

# recursive appraoch
# time: O(n) 
# space: O(n) 
def defang_i_paddr(address)
    # TODO
end