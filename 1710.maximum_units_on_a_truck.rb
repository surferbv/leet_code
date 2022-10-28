# 1710.maximum_units_on_a_truck
# @param {Integer[][]} box_types
# @param {Integer} truck_size
# @return {Integer}
def maximum_units(box_types, truck_size)

    current_num_boxes   = 0
    max_units           = 0

    order_box_types =  box_types.sort_by{|num_boxes, num_units_per_box | num_units_per_box}.reverse

    order_box_types.each do |box_type|
        num_boxes           = box_type[0]
        num_units_per_box   = box_type[1]

        if current_num_boxes <= truck_size
            max_units += num_boxes * num_units_per_box 
            current_num_boxes += num_boxes

        elsif num_boxes > truck_size

        else

        end
        
    end
    
end

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
#       existsing to mark what we have seen. 
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

# sort then search
# time: 
# space: 
def maximum_units(box_types, truck_size)
    unit_count = 0
    
    box_types.sort!{ |box, units| units[1] <=> box[1]}
    box_types.sort_by{ |box| box[1] * -1}

    i = 0
    while truck_size > 0 do
  
        box_count = [truck_size, box_types[i][0]].min

        unit_count += box_count * box_types[i][1]

        truck_size -= box_count

        i += 1
    end

    return unit_count
end