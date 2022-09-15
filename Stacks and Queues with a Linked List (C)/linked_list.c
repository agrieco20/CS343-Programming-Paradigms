/**
 * @author: Anthony Grieco
 * Date: 9/14/2022
 *
 * File Description: Responsible for creating the necessary Linked List structure needed by both "stack.h" and "queue.h"
 */

#include <stdio.h>
#include "linked_list.h"

struct listNode createNewNode(int value, struct listNode *nextNode){
    struct listNode newNode;
    newNode.value = value;
    newNode.nextNode = nextNode;
    return newNode;
}
//Display all elements in list function [only the values]
//void displayNodes(){
//  printf("The following nodes are currently in the Linked List: \n");
//  for ()
//}

//void pushList(){
//}

/*
void test(struct listNode *test1){ //TEMPORARY, DOESN'T WORK
    printf("%d",test1->value);
    if (test1->nextNode != NULL) {
        test(test1->nextNode);
    }
}
 */