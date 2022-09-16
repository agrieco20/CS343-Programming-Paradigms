/**
 * @author: Anthony Grieco
 * Date: 9/14/2022
 *
 * File Description: Responsible for creating the necessary Stack structure needed to increment the Linked List as if it was a Stack
 */

#include <stdio.h>
#include <stdlib.h>

#include "stack.h"

#include "linked_list.h"

//struct listNode * nodeElem;
//struct listNode * ptr;

void stackPush(int changeNodeNum, int * nodeCount, int userInput_int, struct listNode * ptr, struct listNode * nodeElem) {
    changeNodeNum = 0; //Reset
    do {
        if(changeNodeNum < 0){
            printf("You have entered a negative number. Please try again.\n");
            changeNodeNum = 0; //Reset
        }
        printf("How many nodes would you like added to the Linked List as if it were a STACK? \n");
        scanf("%d", &changeNodeNum);
        *nodeCount += changeNodeNum;
    } while(changeNodeNum < 0);

    //Following code assigns the node values the user wants to be added to the Linked List as a STACK
    struct listNode * newNode; //Acts as a placeholder node so that the new information the user wants entered as its own node in the Linked List can be added
    struct listNode tempNode; //Acts as an initializer for temporarily holding the new node created using the "createNewNodes()" function (the numeric value [as sent by the user] and the next address [the TAIL of the Linked List] are then sent to the "newNode" listNode structure so that the previous node can be updated with the current node's address)

    for(int i=0; i<changeNodeNum; i++){
        printf("Enter an integer to be added to the Linked List as if it were a STACK: \n");
        scanf("%d", &userInput_int);

        newNode = (struct listNode *) malloc((sizeof(struct listNode)));
        tempNode = createNewNode(userInput_int, nodeElem->nextNode); //Creates a new node with the value the user has specified
        newNode->value = tempNode.value;
        newNode->nextNode = tempNode.nextNode;
        nodeElem->nextNode = newNode; //Reassigns the "next" address being pointed to at the new node [newNode] just created to house the user's requested data for the Linked List
//        printf("New Node Value: %d\n", newNode->value); //Temporary
//        printf("New Node Address: %p\n", newNode->nextNode); //Temporary
    }

    displayNodes(nodeElem, ptr, *nodeCount); //Prints out all the node values currently being held by the Linked List
}

void stackPop(int changeNodeNum, int * nodeCount, struct listNode * ptr, struct listNode * nodeElem){
    changeNodeNum = 0; //Reset
    do {
        if (changeNodeNum > *nodeCount || changeNodeNum < 0){
            printf("You have entered a value that either exceeds the number of nodes currently in the Linked List or is a negative value.\nPlease try again.\n");
            changeNodeNum = 0; //Reset
        }
        printf("How many nodes would you like removed from the Linked List as if it were a STACK? \n");
        scanf("%d", &changeNodeNum);
    } while (changeNodeNum > *nodeCount || changeNodeNum < 0);
    *nodeCount -= changeNodeNum;

    for(int i=0;i<changeNodeNum;i++) {
        linkedList_Decrementor(nodeElem);
    }

    displayNodes(nodeElem, ptr, *nodeCount); //Prints out all the node values currently being held by the Linked List

}