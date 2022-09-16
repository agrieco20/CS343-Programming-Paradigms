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

int main() {
    struct listNode HEAD;
    HEAD.value = 0;

    struct listNode TAIL;
    TAIL.value = 0;

    HEAD.nextNode = &TAIL;
    TAIL.nextNode = NULL;

    int changeNodeNum = 0; //User Input to add/remove a number of nodes from the Linked List
    int userInput_int = 1; //User Input to indicate what value they want to be stored in the given node
    int nodeCount = 0; //For data verification purposes; determines whether the value the user wishes to decrease the Linked List by [for both Stack and Queue] will exceed the total number of nodes currently in the list

    struct listNode *ptr = NULL; //Pointer used to iterate/add nodes through the Linked List [particularly in the QUEUE Push Function]

    struct listNode * startOfQueuePlacementHolder = &HEAD; //Pointer used to keep track of the beginning of the Queue

    //-------
    printf("HEAD Memory Address: %p\n", &HEAD);
    printf("TAIL Memory Address: %p\n", &TAIL);


    printf("Thank you for using this Linked List Simulator written in C!\nTo start, please type the number corresponding to the action you wish for the Simulator to execute.\n");
    do {
        do {
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
            startOfQueuePlacementHolder = queuePush(changeNodeNum, &nodeCount, userInput_int, ptr, startOfQueuePlacementHolder, &HEAD);
        }

        //--------
        //QUEUE POP:
        else if (userInput_int == 2) {
            queuePop(changeNodeNum, &nodeCount, ptr, &HEAD);
        }

        //--------
        //STACK PUSH:
        else if (userInput_int == 3) {
            startOfQueuePlacementHolder = stackPush(changeNodeNum, &nodeCount, userInput_int, ptr, &HEAD, startOfQueuePlacementHolder);
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

    free(ptr);
    printf("Thank you for using this Linked List Simulator! Please enjoy the rest of your day!");

    return 0;
}