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
    
    while (p && q) {
        // todo 
    }
    
    if (p==NULL) {
        return false;
    }

    if (q==NULL) {
        return false;
    }
    
    return true;
}



void initList()
{
    ListNode l = NULL;
    
    createCircularLists(&l, 1);
    
    insertCircularListsToLast(&l, 2);
    insertCircularListsToLast(&l, 3);
    insertCircularListsToLast(&l, 4);
    insertCircularListsToLast(&l, 5);
    insertCircularListsToLast(&l, 6);
    printListNode(l);
    printListNode(l);
    printListNode(l);
    printListNode(l);
    printListNode(l);
    printListNode(l);
//    printf(<#const char *restrict, ...#>)
    ListNode temp;
    for (temp = l; temp->next != l; temp = temp->next);
    
    temp->next = l->next;
    printListNode(l);
    temp->next = l->next->next;
    printListNode(l);
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        initList();
    }
    return 0;
}
