/**
 * @author: Anthony Grieco
 * Date: 9/3/2022
 *
 * Program Description: This program simulates a Stack and a Queue using a Linked List structure all in the C programming language.
 * File Description: "main.c" acts as the test driver program used to simulate both pushing and popping from both the Stack and the Queue.
 */

#include <stdio.h>
#include <stdlib.h>

#include "linked_list.h"
//#include "stack.h"
//#include "queue.h"

/*struct listNode{
    int value;
    struct listNode *nextNode;
};*/

int main() {
    struct listNode HEAD;
    HEAD.value = 0;
    //HEAD.nextNode = TAIL;

    struct listNode TAIL;
    TAIL.value = 0;

    //HEAD.nextNode = &TAIL;
    TAIL.nextNode = NULL;

    //-------
    //Following definitions need to be declared and initialized in linked_list[.h/.c]
    int totalNumNodes = 2; //Keeps count of how many total nodes are in the current Linked List [Starts at two so that the "HEAD" and "TAIL" nodes are also included]
    int previousNodeTotal = 0; //Keeps count of how many total nodes there were in the previous Linked List to help iterate through the new one when assigning new node values
    int changeNodeNum = 0; //User Input to add/remove a number of nodes from the Linked List
    int userInput_int = 0;
    struct listNode * ptr; //Pointer used to iterate through the Linked List

    //Allocates the initial number of required nodes to be added to the Linked List [the "HEAD" and the "TAIL"]
    ptr = (struct listNode *) malloc((totalNumNodes * sizeof(struct listNode)));
    ptr[0] = HEAD;
    ptr[1] = TAIL;
    //-------

    //printf("Thank you for using this Linked List simulator written in C!\nTo start, please type the number corresponding to the action you would like taken:\n");
    //printf("1. PUSH Nodes onto the Linked List as if it were a STACK\n2. POP Nodes from the Linked List as if it were a STACK\n3. PUSH Nodes onto the Linked List as if it were a QUEUE\n4. POP Nodes from the Linked List as if it were a QUEUE\n5. Display the current Linked List\n");

    //--------
    //Below will need to be implemented as a function in "linked_list.c" and later modified for when the Stack and Queue "structures" are added because the placement of where the nodes need to be will change depending on which "structure" is being used
    //Following code asks how many nodes the user would like to add [PUSH] to the Linked List
    changeNodeNum = 0;
    previousNodeTotal = totalNumNodes - 1;//Updates previous Linked List node count ["-1" because the elements are added where the "TAIL" used to be and the "TAIL" is automatically reassigned to the end of the Linked List]
    printf("How many nodes would you like added to the Linked List? \n");
    scanf("%d", &changeNodeNum);
    totalNumNodes+=changeNodeNum; //Updates the counter for the total number of nodes currently in the Linked List

    ptr = realloc(ptr, (totalNumNodes * sizeof(struct listNode)));//Allocates the number of required nodes the user wishes to add to the Linked List

    ptr[0]=HEAD;
    ptr[totalNumNodes-1] = TAIL;


    //Following code assigns the node values the user wants to be added to the Linked List
    //STACK and QUEUE PUSH:
    for(int i=1; i<changeNodeNum + 1; i++){ //Starts at 1 to compensate for "HEAD"
        do {
            printf("Enter an integer (other than 0) to be added to the Linked List: \n");
            scanf("%d", &userInput_int);

        } while (userInput_int == 0);

        ptr[i+previousNodeTotal] = createNewNode(userInput_int, &ptr[i+previousNodeTotal+1]); //Creates a new node with the value the user has specified and then assigns the following node to be the one that the current node points to
    }
    HEAD.nextNode = &ptr[1];
    //--------

    //NEED TO IMPLEMENT REMOVE FUNCTIONS FOR BOTH STACK AND QUEUE
///*
    //--------
    //Below will need to be implemented as a function in "linked_list.c" and later modified for when the Stack and Queue "structures" are added because the placement of where the nodes need to be will change depending on which "structure" is being used
    //Following code asks how many nodes the user would like to remove [POP] from the Linked List
    changeNodeNum = 0;
    previousNodeTotal = totalNumNodes - 1;//Updates previous Linked List node count ["-1" because the elements are added where the "TAIL" used to be and the "TAIL" is automatically reassigned to the end of the Linked List]
    printf("How many nodes would you like to be removed from the Linked List? \n");
    scanf("%d", &changeNodeNum);
    totalNumNodes-=(changeNodeNum-1); //Updates the counter for the total number of nodes currently in the Linked List

    ///*
    //---
    //WORKS: STACK Exclusive [Above lines + the ones between "//---" right here + ones after "QUEUE Exclusive" execute a perfect STACK removal of elements]:
    ptr = realloc(ptr, (totalNumNodes * sizeof(struct listNode)));//Allocates the number of required nodes the user wishes to add to the Linked List
    //---
    // */

    /*
    //---
    //INCOMPLETE/NOT WORKING: QUEUE Exclusive [Above lines - "STACK EXCLUSIVE" + the ones between "//---" right here + ones after this execute a perfect QUEUE removal of elements]:
    for (int i = 1; i < (totalNumNodes - changeNodeNum - 1); i++){
        ptr[i].value = ptr[i+changeNodeNum].value;
        ptr[i].nextNode = ptr[i+changeNodeNum].nextNode;
    }
    ptr = realloc(ptr, (totalNumNodes * sizeof(struct listNode)));//Allocates the number of required nodes the user wishes to add to the Linked List
    //---
     */

    ptr[0]=HEAD;
    ptr[totalNumNodes-1] = TAIL;
    //--------
//*/

    //--------
    //Below will need to be implemented as a "QUEUE display function in linked_list[.h/.c] or in queue[.h/.c]"
    //QUEUE Display
    printf("The following nodes are currently in the Linked List when seen as a QUEUE: \n");
    for (int i = 0; i < totalNumNodes; i++){
        if (ptr[i].value == 0){
            continue;
        }
        else {
            printf("%d,", ptr[i].value);
        }
    }
    printf("\n");
    //--------

    //--------
    //Below will need to be implemented as a "STACK display function in linked_list[.h/.c] or in stack[.h/.c]"
    //STACK Display
    printf("The following nodes are currently in the Linked List when seen as a STACK: \n");
    //for (int i = 0; i < totalNumNodes; i++){
    for (int i = totalNumNodes - 1; i > 0; i--){
        if (ptr[i].value == 0){
            continue;
        }
        else {
            printf("%d,", ptr[i].value);
        }
    }
    printf("\n");
    //--------

    //-----------
    //Test
    /*
    printf("Head Value: %d\n", HEAD.value);
    //printf("HEAD Next Node Value: %d\n", HEAD.nextNode->value);
    printf("Node 1 Value: %d\n", ptr[1].value);
    printf("Next Node Value: %d\n", ptr[1].nextNode->value);
    */
    //-----------

    free(ptr);
    //printf("Hello, World!\n");
    return 0;
}
