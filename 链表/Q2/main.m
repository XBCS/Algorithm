//
//  main.m
//  Q2
//
//  Created by 李泽宇 on 2020/4/13.
//  Copyright © 2020 xbcs. All rights reserved.
//



/*
    * 删除排序链表中的重复元素
         给定一个排序链表，删除所有重复的元素，使得每个元素只出现一次。
 
    * 示例 1:

        输入: 1->1->2
        输出: 1->2
 
    * 示例 2:

        输入: 1->1->2->3->3
        输出: 1->2->3
 */


#import <Foundation/Foundation.h>
#include "LinkedList.h"


//Status createListNode(ListNode *L)
//{
//    if (*L) {
//        return Error;
//    }
//
//    *L = (ListNode)malloc(sizeof(Node));
//    (*L)->value = Head;
//    (*L)->next = NULL;
//
//    return OK;
//}
//
//
//
//Status insertToHead(ListNode *L, int value)
//{
//
//    if ((*L) == NULL) {
//        return Error;
//    }
//
//    ListNode temp = (ListNode)malloc(sizeof(Node));
//    temp->value = value;
//
//    if ((*L)->next == NULL) {
//        temp->next = NULL;
//        (*L)->next = temp;
//    }
//    else
//    {
//        temp->next = (*L)->next;
//        (*L)->next = temp;
//    }
//    return OK;
//}




void initListNode(ListNode *L1)
{
    Status s;
    s = createSingleLinkListWithHead(L1);
    insertSingleLinkListToHead(L1, 6);
    insertSingleLinkListToHead(L1, 6);
    insertSingleLinkListToHead(L1, 5);
    insertSingleLinkListToHead(L1, 4);
    insertSingleLinkListToHead(L1, 4);
    insertSingleLinkListToHead(L1, 4);
    insertSingleLinkListToHead(L1, 4);
    insertSingleLinkListToHead(L1, 3);
    insertSingleLinkListToHead(L1, 3);
    insertSingleLinkListToHead(L1, 2);
    insertSingleLinkListToHead(L1, 2);
    insertSingleLinkListToHead(L1, 2);
    insertSingleLinkListToHead(L1, 1);
    insertSingleLinkListToHead(L1, 1);
//    insertSingleLinkListToHead(L1, 1);
//    insertSingleLinkListToHead(L1, 1);
//    insertSingleLinkListToHead(L1, 1);
//    insertSingleLinkListToHead(L1, 1);
    
    
}


ListNode deleteDuplicates(ListNode *l)
{
    
    if ((*l)->next == NULL) {
        return *l;
    }
    
    
    ListNode currentNode;
    ListNode nextNode;
    
    currentNode = *l;
    
    nextNode = currentNode->next;
    
    
    while (nextNode) {
        
        if (currentNode->value == nextNode->value) {
            free(nextNode);
            nextNode = nextNode->next;
            currentNode->next = nextNode;
        }
        else
        {
            currentNode = nextNode;
            nextNode = nextNode->next;
        }
    }

    return *l;
}

ListNode deleteDuplicates1(ListNode *head)
{
    ListNode p=*head;

    while(p!=NULL&&p->next!=NULL)
    {
        if(p->value==p->next->value)
        {
            free(p->next);
            p->next=p->next->next;
        }
        else
        {
            p=p->next;
        }
    }
    return *head;
}



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        ListNode l1; // 排序链表: h 1 1 2 2 2 3 3 4 4 4 4 5 6 6
        ListNode l2; // 去重链表: h 1 2 3 4 5 6
        
        initListNode(&l1);
             
        printListNode(l1);
        
        printf("\n\n");
        
        l2 = deleteDuplicates1(&l1);
        
        printListNode(l2);
        
    }
    return 0;
}
