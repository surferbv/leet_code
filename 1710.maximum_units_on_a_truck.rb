# 1710.maximum_units_on_a_truck
# @param {Integer[][]} box_types
# @param {Integer} truck_size
# @return {Integer}
#
# brute force approach
# time: O(n^2) In the worst case we'd have to loop through every box 
#       type to get the max unit box index and then all remaining 
#       boxes if remaining matches the truck size. 
#
# space: O(1) We don't allocated any additional space and use the 
#       existing to mark what we have seen. 
# 
# note: This will get a TLE
def maximum_units(box_types, truck_size)
    unit_count = 0
    remaining_truck_size = truck_size

    while remaining_truck_size > 0 do
        max_unit_box_index = get_max_unit_box(box_types)

        break if max_unit_box_index == -1

        # clever trick to find to grab all that is remaining based on a constraint 
        box_count = [remaining_truck_size, box_types[max_unit_box_index][0]].min

        unit_count += box_count * box_types[max_unit_box_index][1]

        remaining_truck_size -= box_count

        box_types[max_unit_box_index][1] = -1

    end

    return unit_count
end

def get_max_unit_box(box_types)
    max_unit_box_index = -1
    max_units = 0

    box_types.each_with_index do |box, i|
        if box[1] > max_units
            max_units = box[1]
            max_unit_box_index = i
        end
    end

    return max_unit_box_index
end

# sort then iterate 
# time: O(n log n) we have to sort O(n log n) then we have to iterate O(n) thus,
#       O(n log n) + O(n) = O(n log n + n) = O(n log n)
#
# space: O(1) no additional structures added.  
def maximum_units(box_types, truck_size)
    unit_count = 0
    
    box_types.sort_by!{ |box| box[1] * -1} # we multiply by -1 to reverse the list
    
    box_types.each do |box|
        box_count = [truck_size, box[0]].min
        unit_count += box_count * box[1]
        truck_size -= box_count
        break if truck_size == 0
    end
   
    return unit_count
end


# max heap  
# time: O(n log n)
#
# space:O(n)
#
# note: not an optimization of the second approach and ruby does not contain a max heap i.e. priority queue
def maximum_units(box_types, truck_size)
    # TODO have to implement you're own PQ
end