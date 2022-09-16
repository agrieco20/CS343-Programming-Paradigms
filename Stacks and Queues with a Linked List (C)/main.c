/**
 * @author: Anthony Grieco
 * Date: 9/14/2022
 *
 * Program Description: This program simulates a Stack and a Queue using a Linked List structure all in the C programming language.
 * File Description: "main.c" acts as the test driver program used to simulate both pushing and popping from the Linked List structure with both Stack and Queue options in mind.
 */

#include <stdio.h>
#include <stdlib.h>

#include "linked_list.h"
#include "stack.h"
#include "queue.h"

/*struct listNode{
    int value;
    struct listNode *nextNode;
};*/

//struct linkedList{
//    struct listNode;
//};

//Test Stack Incrementor
//newNode.nextValue = HEAD.nextValue;
//HEAD.nextValue = newNode;

////QUEUE Incrementor (Responsible for adding all new QUEUE nodes to the very end of the Linked List [just before the TAIL node])
//struct listNode * linkedList_QueueIncrementor(struct listNode * nodeElem/*, struct listNode * nextNode*/){
//    if (nodeElem->nextNode->nextNode == NULL) {
//        return nodeElem->nextNode;
//    }
//    else{
//        linkedList_QueueIncrementor(nodeElem->nextNode/*, */);
//    }
//}

////STACK Incrementor (Responsible for adding new STACK nodes to the very beginning of the Linked List [right after the HEAD node])
//struct listNode * linkedList_StackIncrementor(struct listNode * nodeElem/*, struct listNode * nextNode*/){
//
//
////    if (nodeElem->nextNode->nextNode == NULL) {
////        //free(nodeElem.nextNode);
//        return nodeElem->nextNode;
////    }
////    else{
////        linkedList_QueueIncrementor(nodeElem->nextNode/*, */);
////    }
//}

////STACK and QUEUE Decrementor:
//void linkedList_Decrementor(struct listNode * nodeElem/*, struct listNode * nextNode*/){
//    struct listNode * temp_ptr;
//    temp_ptr = nodeElem->nextNode;
//    nodeElem->nextNode = nodeElem->nextNode->nextNode;
//    free(temp_ptr);
//}

//Prints out all the node values currently being held by the Linked List
//void displayNodes(struct listNode nodeElem, struct listNode * ptr, int nodeCount){
//    ptr = nodeElem.nextNode;
//    printf("Current Linked List: [");
//    while (ptr->nextNode/*->nextNode*/ != NULL){
//        printf("%d", ptr->value);
//        ptr=ptr->nextNode;
//
//        nodeCount--;
//        if (nodeCount > 0){
//            printf(", ");
//        }
//    }
//     printf("]\n");
//}

int main() {
    struct listNode HEAD;
    HEAD.value = 0;
    //HEAD.nextNode = TAIL;

    struct listNode TAIL;
    TAIL.value = 0;

    HEAD.nextNode = &TAIL;
    TAIL.nextNode = NULL;

//    struct linkedList LL;
//    LL.listNode = HEAD;
//printf("%d", HEAD.nextNode->value);
//printf("test");
    //-------
    ///*
    //Following definitions need to be declared and initialized in linked_list[.h/.c]
//    int totalNumNodes = 2; //Keeps count of how many total nodes are in the current Linked List [Starts at two so that the "HEAD" and "TAIL" nodes are also included]
//    int previousNodeTotal = 0; //Continually keeps a count on where the previous end of the Linked List used to be (so that it will be easier to continue adding elements where the Linked List last left off)

    int changeNodeNum = 0; //User Input to add/remove a number of nodes from the Linked List
    int userInput_int = 1; //User Input to indicate what value they want to be stored in the given node
    int nodeCount = 0; //For data verification purposes; determines whether the value the user wishes to decrease the Linked List by [for both Stack and Queue] will exceed the total number of nodes currently in the list

    struct listNode *ptr = NULL; //Pointer used to iterate through the Linked List

    //-------
    printf("Thank you for using this Linked List Simulator written in C!\nTo start, please type the number corresponding to the action you wish for the Simulator to execute.\n");
//    printf("1. PUSH Nodes onto the Linked List as if it were a STACK\n2. POP Nodes from the Linked List as if it were a STACK\n3. PUSH Nodes onto the Linked List as if it were a QUEUE\n4. POP Nodes from the Linked List as if it were a QUEUE\n5. Display the current Linked List\n6. Exit\n");
    do {
        do {
            //scanf("%d", userInput_int);
            if (userInput_int <= 0 || userInput_int > 6) {
                printf("\nYou have entered an invalid entry. Please try again.\n");
            }

            printf("Options:\n1. PUSH Nodes onto the Linked List as if it were a QUEUE\n2. POP Nodes from the Linked List as if it were a QUEUE\n3. PUSH Nodes onto the Linked List as if it were a STACK\n4. POP Nodes from the Linked List as if it were a STACK\n5. Display the current Linked List\n6. Exit\nOption Choice: ");
            scanf("%d", &userInput_int);

        } while (userInput_int <= 0 || userInput_int > 6);
        printf("\n");

        //--------
        //QUEUE PUSH:
        if (userInput_int == 1) {
            queuePush(changeNodeNum, &nodeCount, userInput_int, ptr, &HEAD);
        }

            //--------
            //QUEUE POP:
        else if (userInput_int == 2) {
            queuePop(changeNodeNum, &nodeCount, ptr, &HEAD);
        }

            //--------
            //STACK PUSH:
        else if (userInput_int == 3) {
            stackPush(changeNodeNum, &nodeCount, userInput_int, ptr, &HEAD);
        }

            //--------
            //STACK POP:
        else if (userInput_int == 4) {
            stackPop(changeNodeNum, &nodeCount, ptr, &HEAD);
        }

            //--------
            //Display Current Linked List::
        else if (userInput_int == 5) {
            displayNodes(&HEAD, ptr, nodeCount);
        }
    } while (userInput_int != 6);

    printf("Thank you for using this Linked List Simulator! Please enjoy the rest of your day!");

    return 0;
}