=begin
    54. Spiral Matrix

    links:
        https://leetcode.com/problems/spiral-matrix/submissions/863574109/
        https://www.youtube.com/watch?v=BJnMZNwUk1M

    approach:
        left right top bottom pointer bounds

    time: O(m * n)

    space: O(1)
        If you are not counting the result output

    note:
        Draw this out using L R and T B. Then print each
        going l to r and t to b. I could not figure this one out on my own 
        but drawing the picture and just printing the firs outer
        layer of the matrix was a good start. The incorporating the
        outer bound shifting was not easy but do-able. 

    til:
        Visualizing using boundaries is helpful

    results:
        Runtime 70 ms Beats 97.6% Memory 211.2 MB Beats 14.71%

=end
# @param {Integer[][]} matrix
# @return {Integer[]}
def spiral_order(matrix)
    result  = []
    left, right = 0, matrix[ 0 ].length - 1
    top, bottom = 0, matrix.length - 1

    while left <= right && top <= bottom
        # move right (keep top fixed increment i)
        for i in ( left..right ) 
            result << matrix[ top ][ i ]
        end
        top += 1

        # move down (keep right fixed increment i)
        for i in ( top..bottom )
            result << matrix[ i ][ right ]
        end
        right -= 1

        # speacial case when you have a matrix that is only a col or row
        break if !(left <= right && top <= bottom)

        # move left (keep bottom fixed decrement i)
        for i in ( right ).downto( left )
            result << matrix[ bottom ][ i ]
        end
        bottom -= 1
        
        # move up (keep left fixed decrement i)
        for i in ( bottom ).downto( top )
            result << matrix[ i ][ left ]
        end
        left += 1
    end

    return result
end