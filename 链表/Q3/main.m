//
//  main.m
//  Q3
//
//  Created by 李泽宇 on 2020/4/13.
//  Copyright © 2020 xbcs. All rights reserved.
//



/*
    * 环形链表
        给定一个链表，判断链表中是否有环。
    
    * 示例:
        链表 1 2 3 4 5 6,  6->next = 5;
        输出 true;
 
    * 示例:链表 1 2 3 4 5 6 6->next = 1;
        输出 true;
 
    * 示例:链表 1 2 3 4 5 6 6->next = NULL;
        输出 false;
 */



#import <Foundation/Foundation.h>
#include "LinkedList.h"






bool hasCycle(ListNode l)
{
    
    if (l==NULL) {
        return false;
    }
    
    ListNode p = l;
    ListNode q = l;
    
    while (p && q && q->next) {
        
        if (p->next == NULL) {
            return false;
        }

        if (q->next->next==NULL) {
            return false;
        }
        
        if (p->next == q->next->next) {
            return true;
        }
        
        p = p->next;
        q = q->next->next;
    }
    
    return false;
}



void initList()
{
    ListNode l = NULL;
    ListNode m = NULL;
    ListNode n = NULL;
    
    createSingleLinkListNoHead(&m, 1);
    createSingleLinkListWithHead(&n);
    createCircularLists(&l, 1);
    
    insertSingleLinkListToHead(&m, 2);
    insertSingleLinkListToHead(&m, 3);
    insertSingleLinkListToHead(&m, 4);
    insertSingleLinkListToHead(&m, 5);
    insertSingleLinkListToHead(&n, 2);
    insertSingleLinkListToHead(&n, 3);
    insertSingleLinkListToHead(&n, 4);
    insertSingleLinkListToHead(&n, 5);
    
    
    
    
    
    insertCircularListsToLast(&l, 2);
    insertCircularListsToLast(&l, 3);
    insertCircularListsToLast(&l, 4);
    insertCircularListsToLast(&l, 5);
    insertCircularListsToLast(&l, 6);
    printListNode(l);
    
//    printf(<#const char *restrict, ...#>)
    ListNode temp;
    for (temp = l; temp->next != l; temp = temp->next);
    
    temp->next = l->next;
    printListNode(l);
    
    temp->next = l->next->next;
    printListNode(l);
    
    printf(" \n --------- \n");
    
    printListNode(l);
    printListNode(m);
    printListNode(n);
    printf(" \n --------- \n");
    
    bool hasC = hasCycle(l);
    printf("\n ---- 循环链表: %d ---- \n", hasC);
    
    hasC = hasCycle(m);
    printf("\n ---- 无头单链表: %d ---- \n", hasC);
    
    hasC = hasCycle(n);
    printf("\n ---- 有头单链表: %d ---- \n", hasC);
    

}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        initList();
    }
    return 0;
}
