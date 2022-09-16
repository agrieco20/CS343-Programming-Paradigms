/**
 * @author: Anthony Grieco
 * Date: 9/14/2022
 *
 * File Description: Provides all the required data declaration and function header information of the Linked List structure in relation to all given "Stack" options (ex: PUSH and POP)
 */

//#include "linked_list.h"

#ifndef C_PROJECT_STACK_H
#define C_PROJECT_STACK_H

#endif //C_PROJECT_STACK_H

//Below function is necessary so that the rest of the Stack functions understand how a "struct listNode" is built and the potential data it can hold
struct listNode createNewNode(int value, struct listNode *nextNode); //Creates a new node which will be added to the Linked List in a manner dependent upon whether the user is currently adding elements to the Linked List with a Stack or a Queue

//Responsible for adding nodes to the Linked List as if it were a STACK
struct listNode * stackPush(int changeNodeNum, int * nodeCount, int userInput_int, struct listNode * ptr, struct listNode * nodeElem, struct listNode * startOfQueuePlacementHolder);

//Responsible for removing nodes from the Linked List as if it were a STACK
void stackPop(int changeNodeNum, int * nodeCount, struct listNode * ptr, struct listNode * nodeElem);