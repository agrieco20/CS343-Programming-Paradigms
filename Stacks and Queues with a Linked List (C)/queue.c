/**
 * @author: Anthony Grieco
 * Date: 9/14/2022
 *
 * File Description: Responsible for creating the necessary Queue structure needed to increment the Linked List as if it was a Queue
 */

#include <stdio.h>
#include <stdlib.h>

#include "queue.h"

#include "linked_list.h"

struct listNode * linkedList_QueueIncrementor(struct listNode * nodeElem/*, struct listNode * nextNode*/){
    if (nodeElem->nextNode->nextNode == NULL) {
        return nodeElem->nextNode;
    }
    else{
        linkedList_QueueIncrementor(nodeElem->nextNode/*, */);
    }
}

struct listNode * queuePush(int changeNodeNum, int * nodeCount, int userInput_int, struct listNode * ptr, struct listNode * nodeElem, struct listNode * displayNodesStartingValue){
    changeNodeNum = 0; //Reset
    do {
        if(changeNodeNum < 0){
            printf("You have entered a negative number. Please try again.\n");
            changeNodeNum = 0; //Reset
        }
        printf("How many nodes would you like added to the Linked List as if it were a QUEUE? \n");
        scanf("%d", &changeNodeNum);
        *nodeCount += changeNodeNum;
    } while(changeNodeNum < 0);

    //Resets the where the QUEUE is supposed to start just in case all the elements/nodes of the Linked List have been deleted and a new starting position [the HEAD] needs to be reassigned
    if (*nodeCount - changeNodeNum == 0){
        nodeElem = displayNodesStartingValue;
    }

    //Following code assigns the node values the user wants to be added to the Linked List as a QUEUE
    struct listNode * newNode; //Acts as a placeholder node so that the new information the user wants entered as its own node in the Linked List can be added
    struct listNode tempNode; //Acts as an initializer for temporarily holding the new node created using the "createNewNodes()" function (the numeric value [as sent by the user] and the next address [the TAIL of the Linked List] are then sent to the "newNode" listNode structure so that the previous node can be updated with the current node's address)
    ptr = nodeElem; //Initializes the start of the Linked List [at "HEAD"]

    for(int i=0; i<changeNodeNum; i++){
        printf("Enter an integer to be added to the Linked List as if it were a QUEUE: \n");
        scanf("%d", &userInput_int);

        newNode = (struct listNode *) malloc((sizeof(struct listNode)));
        tempNode = createNewNode(userInput_int, linkedList_QueueIncrementor(ptr)); //Creates a new node with the value the user has specified

        newNode->value = tempNode.value;
        newNode->nextNode = tempNode.nextNode;

        ptr->nextNode = newNode; //Resets the address being held by the previous node from TAIL to the newest node that's just been built to house the data the user is requesting in the Linked List
        ptr = newNode; //The pointer looks at the newest node [newNode] so that the next piece of data can be placed/added after it in the QUEUE version of the Linked List
        nodeElem = ptr;
    }

    displayNodes(displayNodesStartingValue, ptr, *nodeCount); //Prints out all the node values currently being held by the Linked List
    return nodeElem;
}

void queuePop(int changeNodeNum, int * nodeCount, struct listNode * ptr, struct listNode * nodeElem){
    changeNodeNum = 0; //Reset
    do {
        if (changeNodeNum > *nodeCount || changeNodeNum < 0){
            printf("You have entered a value that either exceeds the number of nodes currently in the Linked List or is a negative value.\nPlease try again.\n");
            changeNodeNum = 0; //Reset
        }

        printf("How many nodes would you like removed from the Linked List as if it were a QUEUE? \n");
        scanf("%d", &changeNodeNum);
    } while (changeNodeNum > *nodeCount || changeNodeNum < 0);

    *nodeCount -= changeNodeNum;

    for(int i=0;i<changeNodeNum;i++) {
        linkedList_Decrementor(nodeElem);
    }

    displayNodes(nodeElem, ptr, *nodeCount); //Prints out all the node values currently being held by the Linked List
}