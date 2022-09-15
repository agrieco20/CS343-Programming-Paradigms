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

//STACK Incrementor (Responsible for adding new STACK nodes to the very beginning of the Linked List [right after the HEAD node])
struct listNode * linkedList_StackIncrementor(struct listNode * nodeElem/*, struct listNode * nextNode*/){


//    if (nodeElem->nextNode->nextNode == NULL) {
//        //free(nodeElem.nextNode);
        return nodeElem->nextNode;
//    }
//    else{
//        linkedList_QueueIncrementor(nodeElem->nextNode/*, */);
//    }
}

//QUEUE Decrementor
struct listNode * testptr;
void linkedList_Decrementor(struct listNode * nodeElem/*, struct listNode * nextNode*/){
    testptr = nodeElem->nextNode;
    nodeElem->nextNode = nodeElem->nextNode->nextNode;
    free(testptr);
}

//void displayNodes(){ //Prints out all the node values currently being held by the Linked List
//    ptr = HEAD.nextNode;
//    while (ptr->nextNode/*->nextNode*/ != NULL){
//        //if (ptr)
//        printf("%d, ", ptr->value);
//        ptr=ptr->nextNode;
//    }
////    printf("Hello World");
//     printf("\n");
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
    int userInput_int = 0;

    struct listNode * ptr; //Pointer used to iterate through the Linked List

    //struct listNode * previousNodeAddress;

    //Allocates the initial number of required nodes to be added to the Linked List [the "HEAD" and the "TAIL"]
//    ptr = (struct listNode *) malloc((totalNumNodes * sizeof(struct listNode)));
//    ptr[0] = HEAD;
//    ptr[1] = TAIL;
    //*/
    /*
    for (int i = 0; i<totalNumNodes; i++){ //TEMPORARY
        printf("Node %d = %d, %p\n", i, ptr[i].value, &ptr[i]);
    }
     */
    //-------

    //printf("Thank you for using this Linked List simulator written in C!\nTo start, please type the number corresponding to the action you would like taken:\n");
    //printf("1. PUSH Nodes onto the Linked List as if it were a STACK\n2. POP Nodes from the Linked List as if it were a STACK\n3. PUSH Nodes onto the Linked List as if it were a QUEUE\n4. POP Nodes from the Linked List as if it were a QUEUE\n5. Display the current Linked List\n");

    //--------
    //Below will need to be implemented as a function in "linked_list.c" and later modified for when the Stack and Queue "structures" are added because the placement of where the nodes need to be will change depending on which "structure" is being used
    //Following code asks how many nodes the user would like to add [PUSH] to the Linked List
//    changeNodeNum = 0;
//    previousNodeTotal = totalNumNodes - 1;//Updates position where the previous end of the Linked List used to be ["-1" because the elements are added where the "TAIL" used to be and the "TAIL" is automatically reassigned to the end of the Linked List]
//    printf("How many nodes would you like added to the Linked List as if it were a QUEUE? \n");
//    scanf("%d", &changeNodeNum);
//    totalNumNodes+=changeNodeNum; //Updates the counter for the total number of nodes currently in the Linked List

//    ptr = realloc(ptr, (totalNumNodes * sizeof(struct listNode)));//Allocates the number of required nodes the user wishes to add to the Linked List


//    ptr[0]=HEAD;
//    ptr[totalNumNodes-1] = TAIL;

    //--------
    //QUEUE PUSH:

    //Below will need to be implemented as a function in "linked_list.c" and later modified for when the Stack and Queue "structures" are added because the placement of where the nodes need to be will change depending on which "structure" is being used
    //Following code asks how many nodes the user would like to add [PUSH] to the Linked List as if it were a QUEUE
    changeNodeNum = 0; //Reset
//    previousNodeTotal = totalNumNodes - 1;//Updates position where the previous end of the Linked List used to be ["-1" because the elements are added where the "TAIL" used to be and the "TAIL" is automatically reassigned to the end of the Linked List]
    printf("How many nodes would you like added to the Linked List as if it were a QUEUE? \n");
    scanf("%d", &changeNodeNum);

    //Following code assigns the node values the user wants to be added to the Linked List as a QUEUE
    struct listNode * newNode; //Acts as a placeholder node so that the new information the user wants entered as its own node in the Linked List can be added
    struct listNode tempNode; //Acts as an initializer for temporarily holding the new node created using the "createNewNodes()" function (the numeric value [as sent by the user] and the next address [the TAIL of the Linked List] are then sent to the "newNode" listNode structure so that the previous node can be updated with the current node's address)
    ptr = &HEAD; //Initializes the start of the Linked List [at "HEAD"]

    for(int i=0; i<changeNodeNum; i++){
        do {
            printf("Enter an integer (other than 0) to be added to the Linked List as if it were a QUEUE: \n");
            scanf("%d", &userInput_int);

        } while (userInput_int == 0);

        newNode = (struct listNode *) malloc((sizeof(struct listNode)));
        tempNode = createNewNode(userInput_int, linkedList_QueueIncrementor(ptr)); //Creates a new node with the value the user has specified
        newNode->value = tempNode.value;
        newNode->nextNode = tempNode.nextNode;
//        ptr[i+previousNodeTotal-1] = createNewNode(userInput_int, &ptr[i+previousNodeTotal]); //Creates a new node with the value the user has specified and then assigns the following node to be the one that the current node points to
        printf("New Node Value: %d\n", newNode->value); //Temporary
        printf("New Node Address: %p\n", newNode->nextNode); //Temporary
        ptr->nextNode = newNode; //Resets the address being held by the previous node from TAIL to the newest node thats just been built to house the data the user is requesting in the Linked List
        ptr = newNode; //The next value that we
    }
    //TEMPORARY Commented Out Function
//    void displayNodes(){ //Prints out all the node values currently being held by the Linked List

    ptr = HEAD.nextNode;
    while (ptr->nextNode/*->nextNode*/ != NULL){
        //if (ptr)
        printf("%d, ", ptr->value);
        ptr=ptr->nextNode;
    }
    printf("\n");
//}


    //--------
    //QUEUE POP:

    changeNodeNum = 0;
    printf("How many nodes would you like removed from the Linked List as if it were a QUEUE? \n");
    scanf("%d", &changeNodeNum);

    for(int i=0;i<changeNodeNum;i++) {
        linkedList_Decrementor(&HEAD);
    }
    //TEMPORARY Commented Out Function
//    void displayNodes(){ //Prints out all the node values currently being held by the Linked List

    ptr = HEAD.nextNode;
    while (ptr->nextNode/*->nextNode*/ != NULL){
        //if (ptr)
        printf("%d, ", ptr->value);
        ptr=ptr->nextNode;
    }
    printf("\n");
//}
    //--------
    //STACK PUSH:

    //Below will need to be implemented as a function in "linked_list.c" and later modified for when the Stack and Queue "structures" are added because the placement of where the nodes need to be will change depending on which "structure" is being used
    //Following code asks how many nodes the user would like to add [PUSH] to the Linked List as if it were a STACK
    changeNodeNum = 0;
//    previousNodeTotal = totalNumNodes - 1;//Updates position where the previous end of the Linked List used to be ["-1" because the elements are added where the "TAIL" used to be and the "TAIL" is automatically reassigned to the end of the Linked List]
    printf("How many nodes would you like added to the Linked List as if it were a STACK? \n");
    scanf("%d", &changeNodeNum);

    //Following code assigns the node values the user wants to be added to the Linked List as a STACK
//    struct listNode * newNode; //Acts as a placeholder node so that the new information the user wants entered as its own node in the Linked List can be added
//    struct listNode tempNode; //Acts as an initializer for temporarily holding the new node created using the "createNewNodes()" function (the numeric value [as sent by the user] and the next address [the TAIL of the Linked List] are then sent to the "newNode" listNode structure so that the previous node can be updated with the current node's address)

    for(int i=0; i<changeNodeNum; i++){
        do {
            printf("Enter an integer (other than 0) to be added to the Linked List as if it were a STACK: \n");
            scanf("%d", &userInput_int);

        } while (userInput_int == 0);

        newNode = (struct listNode *) malloc((sizeof(struct listNode)));
        tempNode = createNewNode(userInput_int, HEAD.nextNode); //Creates a new node with the value the user has specified
        newNode->value = tempNode.value;
        newNode->nextNode = tempNode.nextNode;
//        ptr[i+previousNodeTotal-1] = createNewNode(userInput_int, &ptr[i+previousNodeTotal]); //Creates a new node with the value the user has specified and then assigns the following node to be the one that the current node points to
        HEAD.nextNode = newNode; //Reassigns the "next" address being pointed to at the new node [newNode] just created to house the user's requested data for the Linked List
        printf("New Node Value: %d\n", newNode->value); //Temporary
        printf("New Node Address: %p\n", newNode->nextNode); //Temporary
//        ptr->nextNode = newNode; //Assigns the value
//        ptr = newNode;
    }
    //TEMPORARY Commented Out Function
//    void displayNodes(){ //Prints out all the node values currently being held by the Linked List

    ptr = HEAD.nextNode;
    while (ptr->nextNode/*->nextNode*/ != NULL){
        //if (ptr)
        printf("%d, ", ptr->value);
        ptr=ptr->nextNode;
    }
    printf("\n");
//}

    //--------
    //STACK POP:

    changeNodeNum = 0;
    printf("How many nodes would you like removed from the Linked List as if it were a STACK? \n");
    scanf("%d", &changeNodeNum);

    for(int i=0;i<changeNodeNum;i++) {
        linkedList_Decrementor(&HEAD);
    }
    //TEMPORARY Commented Out Function
//    void displayNodes(){ //Prints out all the node values currently being held by the Linked List

    ptr = HEAD.nextNode;
    while (ptr->nextNode/*->nextNode*/ != NULL){
        //if (ptr)
        printf("%d, ", ptr->value);
        ptr=ptr->nextNode;
    }
    printf("\n");
//}



//    for (int i = 0; i<changeNodeNum; i++){
//        //linkedList_StackIncrementor(&HEAD);
//    }
//    //printf("Hello World");
//}

//    HEAD.nextNode = &ptr[1]; //(&TAIL)
    //--------
//
//    /*
//    printf("Memory Address held by Node after Head Node: %p\n",HEAD.nextNode); //TEMPORARY
//    printf("Value held by Node after Head Node: %d\n",HEAD.nextNode->value); //TEMPORARY
//    */
//
//    //NEED TO IMPLEMENT REMOVE FUNCTIONS FOR BOTH STACK AND QUEUE IN .h AND .c FILES
/////*
//    //--------
//    //Below will need to be implemented as a function in "linked_list.c" and later modified for when the Stack and Queue "structures" are added because the placement of where the nodes need to be will change depending on which "structure" is being used
//    //Following code asks how many nodes the user would like to remove [POP] from the Linked List
//    changeNodeNum = 0;
//    previousNodeTotal = totalNumNodes - 1;//Updates previous Linked List node count ["-1" because the elements are added where the "TAIL" used to be and the "TAIL" is automatically reassigned to the end of the Linked List]
//    printf("How many nodes would you like to be removed from the Linked List? \n");
//    scanf("%d", &changeNodeNum);
//    totalNumNodes-=(changeNodeNum/*-1*/); //Updates the counter for the total number of nodes currently in the Linked List
//
//    ///*
//    //---
//    //WORKS: STACK Exclusive [Above lines + the ones between "//---" right here + ones after "QUEUE Exclusive" execute a perfect STACK removal of elements]:
////    ptr = realloc(ptr, (totalNumNodes * sizeof(struct listNode)));//Allocates the number of required nodes the user wishes to add to the Linked List
//    //---
//    // */
//
//    // /*
//    //---
//    //WORKING: QUEUE Exclusive [Above lines - "STACK EXCLUSIVE" + the ones between "//---" right here + ones after this execute a perfect QUEUE removal of elements]:
//
//    //Resets the values of each node of the Linked List so that however many nodes the user wants deleted from the front of the QUEUE Linked List will be deleted from the front and replaced by any remaining nodes in the Linked List
//    for (int i = 1; i<totalNumNodes; i++){
//        ptr[i] = ptr[i+(changeNodeNum)];
//    }
//
//    ptr = realloc(ptr, (totalNumNodes * sizeof(struct listNode))); //Allocates the number of required nodes the user wishes to add to the Linked List
//
//    HEAD.nextNode = &ptr[changeNodeNum]; //Resets HEAD Node so that it now looks at the new next Node in the Linked List
//
//    /*
//    printf("Memory Address held by Node after Head Node: %p\n",HEAD.nextNode); //TEMPORARY
//    printf("Value held by Node after Head Node: %d\n",HEAD.nextNode->value); //TEMPORARY
//    */
//
//    //---
//    // */
//
//    ptr[0]=HEAD;
//    ptr[totalNumNodes-1] = TAIL;
//    //--------
////*/
//
//    //--------
//    //Below will need to be implemented as a "QUEUE display function in linked_list[.h/.c] or in queue[.h/.c]"
//    //QUEUE Display
//    printf("The following nodes are currently in the Linked List when seen as a QUEUE: \n");
//    for (int i = 0; i < totalNumNodes; i++){
//        if (ptr[i].value == 0){
//            continue;
//        }
//        else {
//            printf("%d,", ptr[i].value);
//        }
//    }
//    printf("\n");
//    //--------
//
//    //--------
//    //Below will need to be implemented as a "STACK display function in linked_list[.h/.c] or in stack[.h/.c]"
//    //STACK Display
//    printf("The following nodes are currently in the Linked List when seen as a STACK: \n");
//    //for (int i = 0; i < totalNumNodes; i++){
//    for (int i = totalNumNodes - 1; i > 0; i--){
//        if (ptr[i].value == 0){
//            continue;
//        }
//        else {
//            printf("%d,", ptr[i].value);
//        }
//    }
//    printf("\n");
//    //--------
//*/
//    //printf("Number of Nodes in Linked List: %d", totalNumNodes); //TEMPORARY
//
//    /*
//    for (int i = 0; i<totalNumNodes; i++){ //TEMPORARY
//        printf("Node %d = %d, %p\n", i, ptr[i].value, &ptr[i]);
//    }
//
//    //test(&HEAD); //TEMPORARY, DOESN'T WORK
//
//    //-----------
//    //Test
//
//    printf("Head Value: %d\n", HEAD.value);
//    //printf("HEAD Next Node Value: %d\n", HEAD.nextNode->value);
//    printf("Node 1 Value: %d\n", ptr[1].value);
//    printf("Next Node Value: %d\n", ptr[1].nextNode->value);
//    */
//    //-----------
//
//    /*
//    printf("Memory Address: %p\n", &HEAD.nextNode->nextNode->value); //TEMPORARY TEST
//    printf("Value at Next Address: %d\n", HEAD.nextNode->nextNode->value); //TEMPORARY TEST
//    */
//    /*
//   //Test, doesn't fully work yet and will more than likely need to be converted into a self-sustainable function without the iterator ("ptr[i]") but prints out all values stored in the Linked List
//   int i = 0;
//   while (ptr[i].nextNode != NULL /*&& ptr[i].value != 0/) {
//       printf("Node Value: %d\n", ptr[i].nextNode->value); //TEMPORARY, prints node values
//       //printf("Node Memory Address: %p\n", &ptr[i].nextNode->value); //TEMPORARY, prints node addresses
//       i++;
//   }
//    */
//
    //free(ptr);
    //printf("Hello, World!\n");
    return 0;
}