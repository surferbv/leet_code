# algorithm: detect_cycle
# 1. Initialize two pointers slow and fast to the head of the linked list
# 2. Move the slow pointer ahead and the fast pointer two nodes ahead
# 3. Check if both pointers point to the same node at any point. If yes return TRUE
# 4. If the fast poitner reaches the end of the linked list return FALSE

# approach: two pointers
# time: O(n)
# space: O(1) 
from linked_list import LinkedList

def detect_cycle(head):
    slow = fast = head
    while fast and fast.next:
        slow = slow.next
        fast = fast.next.next
        if slow == fast:
            return True
    
    return False

# educative version
from linked_list import LinkedList
from print_list import *

def detect_cycle(head):
    if head is None:
        return False

    slow, fast = head, head
    
    while fast and fast.next:
        slow = slow.next
        fast = fast.next.next
        
        if slow == fast:
            return True
    
    return False

# Driver code
def main():

    input = (
             [2, 4, 6, 8, 10, 12],
             [1, 3, 5, 7, 9, 11],
             [0, 1, 2, 3, 4, 6],
             [3, 4, 7, 9, 11, 17],
             [5, 1, 4, 9, 2, 3],
            )
    pos = [0, -1, 1, -1, 2]
    j = 1

    for i in range(len(input)):

        input_linked_list = LinkedList()
        input_linked_list.create_linked_list(input[i])
        print(f"{j}.\tInput: ", sep="", end="")
        if pos[i] == -1:
            print_list_with_forward_arrow(input_linked_list.head)
        else:
            print_list_with_forward_arrow_loop(input_linked_list.head)
        print("\n\tpos:", pos[i])
        if pos[i] != -1:
            length = input_linked_list.get_length(input_linked_list.head)
            last_node = input_linked_list.get_node(input_linked_list.head, length - 1)
            last_node.next = input_linked_list.get_node(input_linked_list.head, pos[i])

        print(f"\n\tDetected cycle = {detect_cycle(input_linked_list.head)}")
        j += 1
        print("-"*100, "\n")


if __name__ == "__main__":
    main()
