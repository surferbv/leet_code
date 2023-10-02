# remove_nth_last_node.py
from linked_list import LinkedList
from linked_list_node import LinkedListNode

# remove_nth_last_node method will remove the nth last node from the
# time: O(n)
# space: O(1)
def remove_nth_last_node(head, n):
    left = right = head

    # Move right pointer n steps ahead of left pointer
    for i in range(n):
        right = right.next

    # now move both pointers one step at a time until right reaches the lats node i.e. right.next is None
    while right.next:
        left = left.next
        right = right.next
    
    # now the left pointer is at the node just before the nth last node so we can remove the nth last node by 
    # changing the next pointer of left pointer to the node after the nth last node
    left.next = left.next.next

    # return the head of the linked list
    return head