# algorithm: sort_colors
#
# 1. declare three pointers red initialized to the array's first index, 
#    white initialized to the array's first index and blue initialized to the array's last index
#
# 2. if colors[white] is 0 then swap colors[white] and colors[red] and increment red and white by 1
#
# 3. otherwise if colors[white] is 1, the number is already in the correct position so no need to swap
#    and we increment white by 1
#
# 4. otherwise if colors[white] is 2, we swap the values of colors[white] and colors[blue] and decrement
#    blue by 1
#
# appraoch: two pointers
# time: O(n)
# space: O(1)
def sort_colors(colors):
    # step 1
    ptr_red = ptr_white = 0
    ptr_blue = len(colors) - 1

    while ptr_white <= ptr_blue:
        # step 2
        if colors[ptr_white] == 0:
            colors[ptr_white], colors[ptr_red] = colors[ptr_red], colors[ptr_white]
            ptr_white += 1
            ptr_red += 1
        elif colors[ptr_white] == 1:
            # step 3
            ptr_white += 1
        else:
            # step 4 this assumes that the array only contains 0, 1 and 2
            colors[ptr_white], colors[ptr_blue] = colors[ptr_blue], colors[ptr_white]
            ptr_blue -= 1

    return colors



# educative version
def sort_colors(colors):
    # Initialize the red, white, and blue pointers
    red, white, blue = 0, 0, len(colors) - 1
    
    while white <= blue:
        # If the white pointer is pointing to red
        if colors[white] == 0:
            # Swap the values if the red pointer is not pointing to red
            if colors[red] != 0:
                colors[red], colors[white] = colors[white], colors[red]
            
            # Increment both the red and white pointers
            white += 1
            red += 1

        # If the white pointer is pointing to white, no swapping is required
        # Just increment the white pointer
        elif colors[white] == 1:
            white += 1

        # If the white pointer is pointing to blue
        else:
            # Swap the values if the blue pointer is not pointing to blue
            if colors[blue] != 2:
                colors[white], colors[blue] = colors[blue], colors[white]

            # Decrement the blue pointer
            blue -= 1

    return colors

# Driver code
def main():
    inputs = [[0, 1, 0], [1, 1, 0, 2], [2, 1, 1, 0, 0], [2, 2, 2, 0, 1, 0], [2, 1, 1, 0, 1, 0, 2]]

    # Iterate over the inputs and print the sorted array for each
    for i in range(len(inputs)):
        print(i + 1, ".\tcolors:", inputs[i].copy(),
              "\n\n\tThe sorted array is:", sort_colors(inputs[i]))
        print("-" * 100)

if __name__ == "__main__":
    main()