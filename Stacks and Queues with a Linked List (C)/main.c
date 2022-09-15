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
//#include "queue.h"

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

//QUEUE Incrementor (Responsible for adding all new QUEUE nodes to the very end of the Linked List [just before the TAIL node])
struct listNode * linkedList_QueueIncrementor(struct listNode * nodeElem/*, struct listNode * nextNode*/){
    if (nodeElem->nextNode->nextNode == NULL) {
        //free(nodeElem.nextNode);
        return nodeElem->nextNode;
    }
    else{
        linkedList_QueueIncrementor(nodeElem->nextNode/*, */);
    }
}

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

//STACK and QUEUE Decrementor:
void linkedList_Decrementor(struct listNode * nodeElem/*, struct listNode * nextNode*/){
    struct listNode * temp_ptr;
    temp_ptr = nodeElem->nextNode;
    nodeElem->nextNode = nodeElem->nextNode->nextNode;
    free(temp_ptr);
}

//Prints out all the node values currently being held by the Linked List
void displayNodes(struct listNode nodeElem, struct listNode * ptr, int nodeCount){
    ptr = nodeElem.nextNode;
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
    int userInput_int = 0; //User Input to indicate what value they want to be stored in the given node
    int nodeCount = 0; //For data verification purposes; determines whether the value the user wishes to decrease the Linked List by [for both Stack and Queue] will exceed the total number of nodes currently in the list

    struct listNode * ptr; //Pointer used to iterate through the Linked List

    //-------

    printf("Thank you for using this Linked List simulator written in C!\nTo start, please type the number corresponding to the action you would like taken:\n");
    printf("1. PUSH Nodes onto the Linked List as if it were a STACK\n2. POP Nodes from the Linked List as if it were a STACK\n3. PUSH Nodes onto the Linked List as if it were a QUEUE\n4. POP Nodes from the Linked List as if it were a QUEUE\n5. Display the current Linked List\n6. Exit\n");
//    do{
//        scanf("%d", userInput_int);
//        if (userInput_int <= 0 || userInput_int > 6){
//            printf("You have entered an invalid entry. Please try again.\n");
//        }
//    } while (userInput_int <=0 || userInput_int >6);

    //--------
    //QUEUE PUSH:

    //Below will need to be implemented as a function in "linked_list.c" and later modified for when the Stack and Queue "structures" are added because the placement of where the nodes need to be will change depending on which "structure" is being used
    //Following code asks how many nodes the user would like to add [PUSH] to the Linked List as if it were a QUEUE
    changeNodeNum = 0; //Reset
    do {
        if(changeNodeNum < 0){
            printf("You have entered a negative number. Please try again.\n");
            changeNodeNum = 0; //Reset
        }
        printf("How many nodes would you like added to the Linked List as if it were a QUEUE? \n");
        scanf("%d", &changeNodeNum);
        nodeCount += changeNodeNum;
    } while(changeNodeNum < 0);

    //Following code assigns the node values the user wants to be added to the Linked List as a QUEUE
    struct listNode * newNode; //Acts as a placeholder node so that the new information the user wants entered as its own node in the Linked List can be added
    struct listNode tempNode; //Acts as an initializer for temporarily holding the new node created using the "createNewNodes()" function (the numeric value [as sent by the user] and the next address [the TAIL of the Linked List] are then sent to the "newNode" listNode structure so that the previous node can be updated with the current node's address)
    ptr = &HEAD; //Initializes the start of the Linked List [at "HEAD"]

    for(int i=0; i<changeNodeNum; i++){
        printf("Enter an integer to be added to the Linked List as if it were a QUEUE: \n");
        scanf("%d", &userInput_int);

        newNode = (struct listNode *) malloc((sizeof(struct listNode)));
        tempNode = createNewNode(userInput_int, linkedList_QueueIncrementor(ptr)); //Creates a new node with the value the user has specified
        newNode->value = tempNode.value;
        newNode->nextNode = tempNode.nextNode;
//        printf("New Node Value: %d\n", newNode->value); //Temporary
//        printf("New Node Address: %p\n", newNode->nextNode); //Temporary
        ptr->nextNode = newNode; //Resets the address being held by the previous node from TAIL to the newest node that's just been built to house the data the user is requesting in the Linked List
        ptr = newNode; //The pointer looks at the newest node [newNode] so that the next piece of data can be placed/added after it in the QUEUE version of the Linked List
    }

    displayNodes(HEAD, ptr, nodeCount); //Prints out all the node values currently being held by the Linked List

    //--------
    //QUEUE POP:
    changeNodeNum = 0; //Reset
    do {
        if (changeNodeNum > nodeCount || changeNodeNum < 0){
            printf("You have entered a value that either exceeds the number of nodes currently in the Linked List or is a negative value.\nPlease try again.\n");
            changeNodeNum = 0; //Reset
        }
        printf("How many nodes would you like removed from the Linked List as if it were a QUEUE? \n");
        scanf("%d", &changeNodeNum);
    } while (changeNodeNum > nodeCount || changeNodeNum < 0);
    nodeCount -= changeNodeNum;

    for(int i=0;i<changeNodeNum;i++) {
        linkedList_Decrementor(&HEAD);
    }

    displayNodes(HEAD, ptr, nodeCount); //Prints out all the node values currently being held by the Linked List

    //--------
    //STACK PUSH:

    //Below will need to be implemented as a function in "linked_list.c" and later modified for when the Stack and Queue "structures" are added because the placement of where the nodes need to be will change depending on which "structure" is being used
    //Following code asks how many nodes the user would like to add [PUSH] to the Linked List as if it were a STACK

    changeNodeNum = 0; //Reset
    do {
        if(changeNodeNum < 0){
            printf("You have entered a negative number. Please try again.\n");
            changeNodeNum = 0; //Reset
        }
        printf("How many nodes would you like added to the Linked List as if it were a STACK? \n");
        scanf("%d", &changeNodeNum);
        nodeCount += changeNodeNum;
    } while(changeNodeNum < 0);

    //Following code assigns the node values the user wants to be added to the Linked List as a STACK
    for(int i=0; i<changeNodeNum; i++){
        printf("Enter an integer to be added to the Linked List as if it were a STACK: \n");
        scanf("%d", &userInput_int);

        newNode = (struct listNode *) malloc((sizeof(struct listNode)));
        tempNode = createNewNode(userInput_int, HEAD.nextNode); //Creates a new node with the value the user has specified
        newNode->value = tempNode.value;
        newNode->nextNode = tempNode.nextNode;
        HEAD.nextNode = newNode; //Reassigns the "next" address being pointed to at the new node [newNode] just created to house the user's requested data for the Linked List
//        printf("New Node Value: %d\n", newNode->value); //Temporary
//        printf("New Node Address: %p\n", newNode->nextNode); //Temporary
    }

    displayNodes(HEAD, ptr, nodeCount); //Prints out all the node values currently being held by the Linked List

    //--------
    //STACK POP:
    changeNodeNum = 0; //Reset
    do {
        if (changeNodeNum > nodeCount || changeNodeNum < 0){
            printf("You have entered a value that either exceeds the number of nodes currently in the Linked List or is a negative value.\nPlease try again.\n");
            changeNodeNum = 0; //Reset
        }
        printf("How many nodes would you like removed from the Linked List as if it were a STACK? \n");
        scanf("%d", &changeNodeNum);
    } while (changeNodeNum > nodeCount || changeNodeNum < 0);
    nodeCount -= changeNodeNum;

    for(int i=0;i<changeNodeNum;i++) {
        linkedList_Decrementor(&HEAD);
    }

    displayNodes(HEAD, ptr, nodeCount); //Prints out all the node values currently being held by the Linked List

    //--------
    return 0;
}