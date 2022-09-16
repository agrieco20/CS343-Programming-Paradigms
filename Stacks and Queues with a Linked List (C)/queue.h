/**
 * @author: Anthony Grieco
 * Date: 9/14/2022
 *
 * File Description: Provides all the required data declaration and function header information of the Linked List structure in relation to all given "QUEUE" options (ex: PUSH and POP)
 */

#ifndef C_PROJECT_QUEUE_H
#define C_PROJECT_QUEUE_H

#endif //C_PROJECT_QUEUE_H


//Below function is necessary so that the rest of the Queue functions understand how a "struct listNode" is built and the potential data it can hold
//QUEUE Incrementor (Responsible for adding all new QUEUE nodes to the very end of the Linked List [just before the TAIL node])
struct listNode * linkedList_QueueIncrementor(struct listNode * nodeElem/*, struct listNode * nextNode*/);

//Responsible for adding nodes to the Linked List as if it were a QUEUE
void queuePush(int changeNodeNum, int * nodeCount, int userInput_int, struct listNode * ptr, struct listNode * nodeElem);

//Responsible for removing nodes from the Linked List as if it were a QUEUE
void queuePop(int changeNodeNum, int * nodeCount, struct listNode * ptr, struct listNode * nodeElem);