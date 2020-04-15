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
    
    createSingleAcyclicListListNoHead(&m, 1);
    createSingleAcyclicListWithHead(&n);
    createSingleCircularList(&l, 1);
    
    insertSingleAcyclicListToHead(&m, 2);
    insertSingleAcyclicListToHead(&m, 3);
    insertSingleAcyclicListToHead(&m, 4);
    insertSingleAcyclicListToHead(&m, 5);
    insertSingleAcyclicListToHead(&n, 2);
    insertSingleAcyclicListToHead(&n, 3);
    insertSingleAcyclicListToHead(&n, 4);
    insertSingleAcyclicListToHead(&n, 5);

    
    insertSingleCircularListToLast(&l, 2);
    insertSingleCircularListToLast(&l, 3);
    insertSingleCircularListToLast(&l, 4);
    insertSingleCircularListToLast(&l, 5);
    insertSingleCircularListToLast(&l, 6);
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
    printf("\n ---- 循环单向链表: %d ---- \n", hasC);
    
    hasC = hasCycle(m);
    printf("\n ---- 无头非循环单向链表: %d ---- \n", hasC);
    
    hasC = hasCycle(n);
    printf("\n ---- 有头非循环单向链表: %d ---- \n", hasC);
    

}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        initList();
    }
    return 0;
}
