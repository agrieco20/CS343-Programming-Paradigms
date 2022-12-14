/**
 * @author: Anthony Grieco
 * Date: 9/14/2022
 *
 * File Description: Responsible for creating the necessary Linked List structure needed by both "stack.h" and "queue.h"
 */

#include <stdio.h>
#include <stdlib.h>

#include "linked_list.h"

struct listNode createNewNode(int value, struct listNode *nextNode){
    struct listNode newNode;
    newNode.value = value;
    newNode.nextNode = nextNode;
    return newNode;
}

void displayNodes(struct listNode * nodeElem, struct listNode * ptr, int nodeCount){
    ptr = nodeElem->nextNode;
    printf("Current Linked List: [");
    while (ptr->nextNode/*->nextNode*/ != NULL){
        printf("%d", ptr->value);
        ptr=ptr->nextNode;

        nodeCount--;
        if (nodeCount > 0){
            printf(", ");
        }
    }
    printf("]\n");
}

//STACK and QUEUE Decrementor: [Pops Nodes from the "beginning" of the Linked List {at the HEAD}]
void linkedList_Decrementor(struct listNode * nodeElem/*, struct listNode * nextNode*/){
    struct listNode * temp_ptr;
    temp_ptr = nodeElem->nextNode;
    nodeElem->nextNode = nodeElem->nextNode->nextNode;

    free(temp_ptr);
}