/**
 * @author: Anthony Grieco
 * Date: 9/14/2022
 *
 * File Description: Provides all the required data declaration and function header information of the Linked List structure to "main.c", "stack.h", and "queue.h"
 */

#ifndef C_PROJECT_LINKED_LIST_H
#define C_PROJECT_LINKED_LIST_H

#endif //C_PROJECT_LINKED_LIST_H

struct listNode{
    int value;
    struct listNode *nextNode; //Stores the address of the next node in the Linked List
};

struct listNode createNewNode(int value, struct listNode *nextNode); //Creates a new node which will be added to the Linked List in a manner dependent upon whether the user is currently adding elements to the Linked List with a Stack or a Queue

void displayNodes(struct listNode * nodeElem, struct listNode * ptr, int nodeCount); //Prints out all the node values currently being held by the Linked List

void linkedList_Decrementor(struct listNode * nodeElem);