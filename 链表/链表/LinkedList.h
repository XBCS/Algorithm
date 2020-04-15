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

//struct NODE Node;
struct LISTNODE
{
    int value;
    struct LISTNODE *next;
};


static struct LISTNODE Node;


typedef struct LISTNODE* ListNode;




Status createSingleLinkListWithHead(ListNode *l);

Status createSingleLinkListNoHead(ListNode *l, int data);


Status insertSingleLinkListToHead(ListNode *l, int value);

Status insertSingleLinkListToLast(ListNode *l, int value);

Status createCircularLists(ListNode *l, int data);

Status insertCircularListsToHead(ListNode *l, int data);

Status insertCircularListsToLast(ListNode *l, int data);

Status insertCircularListsAtIndex(ListNode *l, int index, int data);

void printListNode(ListNode l);



#endif /* LinkedList_h */
