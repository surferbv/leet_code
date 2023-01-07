=begin

    title:
        383. Ransom Note

    links:
        https://leetcode.com/problems/ransom-note/

    approach:
        one hash map approach

    time: O(n)
        m is the length of the magazine, n is the length of ransom note. 
        The worst case m >= n because when m < n we exit the loop early returning false.
        We create two hashes one for the magazine and one for the ransom note. 
        We then iterate through all hash or the magazine thus 
        since we are considering the worst case i.e. m >= n thus we can substitute n for m. 
        O(n) + O(m) + O(n)  = O(n) + O(n) + O(n) 
                            = O(3n) 
                            = O(n)

    space: O(k) / O(1)
        We build two hashes each with k characters for 26 characters thus we way O(1)

    note:
        Build to hashes then compare their occurrence. 

    til:
        subtracting the characters from the ransom note 
        allows you to use only one hash. 
        
    results:
        Runtime 200 ms Beats 69.85% Memory 214.7 MB Beats 56.28%            

=end
# @param {String} ransom_note
# @param {String} magazine
# @return {Boolean}
def can_construct(ransom_note, magazine)
    h_mag = Hash.new(0)
    
    magazine.chars.each do |c|
        h_mag[c] += 1
    end

    ransom_note.chars.each do |c|
        count_in_mag = h_mag[c]
        return false if count_in_mag == 0
        h_mag[c] = count_in_mag -= 1
    end

    return true
end

=begin
    
    approach:
        two hash maps approach

    time: O(n)        

    space: O(k) / O(1)

    note:
        Build to hashes then compare their occurrence. 

    til:
        
    results:
        Runtime 182 ms Beats 77.89% Memory 216.6 MB Beats 22.11%            

=end
# @param {String} ransom_note
# @param {String} magazine
# @return {Boolean}
def can_construct(ransom_note, magazine)
    h_rn    = Hash.new(0)
    h_mag   = Hash.new(0)

    ransom_note.chars.each do |c|
        h_rn[c] += 1
    end

    magazine.chars.each do |c|
        h_mag[c] += 1
    end

    h_rn.each do |k, v|
        return false if !h_mag.key?(k) || v > h_mag[k]
    end

    return true
end