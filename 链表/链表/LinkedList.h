//
//  LinkedList.h
//  链表
//
//  Created by 李泽宇 on 2020/4/13.
//  Copyright © 2020 xbcs. All rights reserved.
//

#ifndef LinkedList_h
#define LinkedList_h

//#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <pthread.h>

#define OK 1
#define Error -1
#define Head -9999999



typedef int Status;


struct LinkedListNode
{
    int value;
    struct LinkedListNode *prior;
    struct LinkedListNode *next;
};


static struct LinkedListNode Node;


typedef struct LinkedListNode* ListNode;




Status createSingleAcyclicListWithHead(ListNode *l);

Status createSingleAcyclicListListNoHead(ListNode *l, int data);

Status insertSingleAcyclicListToHead(ListNode *l, int value);

Status insertSingleAcyclicListToLast(ListNode *l, int value);

Status createSingleCircularList(ListNode *l, int data);

Status insertSingleCircularListToHead(ListNode *l, int data);

Status insertSingleAcyclicList(ListNode *l, ListNode node);

Status insertSingleCircularListToLast(ListNode *l, int data);

Status insertSingleCircularListAtIndex(ListNode *l, int index, int data);


void printListNode(ListNode l);




#endif /* LinkedList_h */
