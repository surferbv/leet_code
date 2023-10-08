# get_middle_mode.py
#
# algorithm:
# 1. Create two pointers, slow and fast, initially pointing to the head of the linked list
# 2. Traverse the linekd list while moving the slow pointer by one node and the fast pointer by two nodes
# 3. When the fast pointer reaches the last node or is null, the middle pointer will be pointing to the middle node of the linked list
# 4. Return the node that the slow pointer is pointing to

from linked_list import LinkedList

# The code in "linked_list.py" can be used to create a linked list out of a list. 
# The code in "linked_list_traversal.py" can be used to traverse the linked list.
# The code in "linked_list_reversal.py" can be used to reverse the linked list.

# approach: two pointers
# time complexity: O(n)
# space complexity: O(1)
def get_middle_node(head):
    slow, fast = head, head

    while fast and fast.next:
        slow = slow.next
        fast = fast.next.next

    return slow 



# educative version
from linked_list import LinkedList
from print_list import print_list_with_forward_arrow

def get_middle_node(head):
    slow = head
    fast = head

    while fast and fast.next:
        slow = slow.next
        fast = fast.next.next

    return slow

# Driver code
def main():

    input = (
        [1, 2, 3, 4, 5],
        [1, 2, 3, 4, 5, 6],
        [3, 2, 1],
        [10],
        [1, 2],
    )

    for i in range(len(input)):
        input_linked_list = LinkedList()
        input_linked_list.create_linked_list(input[i])
        print(i+1, ".\tLinked list: ", sep="", end="")
        print_list_with_forward_arrow(input_linked_list.head)
        print("\n\tMiddle of the linked list: ",
              get_middle_node(input_linked_list.head).data)
        print("-"*100, "\n")

if __name__ == "__main__":
    main()