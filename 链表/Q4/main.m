//
//  main.m
//  Q4
//
//  Created by 李泽宇 on 2020/4/15.
//  Copyright © 2020 xbcs. All rights reserved.
//

/*
    * 相交链表
        编写一个程序，找到两个单链表相交的起始节点。
        条件: 输出后链表1 链表2结构不变, 无相交输出null, 有相交输出相交点链表指针.
 
    * 示例1
        链表1: 1 2 3 7 8 9  链表2: 4 5 6 7 8 9;
        3->next == 7 == 6->next;
 
      示例2
        链表1: a b z x c  链表2: q w e r t y b z x c;
        b->next == z == b->next;
        
 */




#import <Foundation/Foundation.h>
#import "LinkedList.h"






ListNode getIntersectionNode(ListNode *l1, ListNode *l2)
{
    
    if (*l1 == NULL) {
        return NULL;
    }
    
    if (*l2 == NULL) {
        return NULL;
    }
    
    ListNode h1, t1, h2, t2;
    
    h1 = t1 = *l1;
    h2 = t2 = *l2;
    
    while (t1 != t2) {
 
        if (t1->next == NULL) {
            
            if (h1 == (*l1)) {
                t1 = *l2;
                h1 = *l2;
            }
            else
            {
                return NULL;
            }
        } else
        {
            t1 = t1->next;
        }
        
        if (t2->next == NULL) {
            
            if (h2 == (*l2)) {
                t2 = *l1;
                h2 = *l1;
            }
            else
            {
                return NULL;
            }
        }
        else
        {
            t2 = t2->next;
        }
    }
    
    return t1;
}



void test()
{
    ListNode l1, l2 = NULL;
    
    createSingleAcyclicListListNoHead(&l1, 0);
    
    createSingleAcyclicListListNoHead(&l2, 10);
    
    for (int i=1; i<4; i++) {
        insertSingleAcyclicListToLast(&l1, i);
    }
    
    // 不等长
//    for (int i=11; i<17; i++) {
//        insertSingleAcyclicListToLast(&l2, i);
//    }
    
    // 等长
    for (int i=11; i<14; i++) {
        insertSingleAcyclicListToLast(&l2, i);
    }
    
    
    ListNode node = (ListNode)malloc(sizeof(Node));
    
    if (node == NULL) {
        return;
    }
    
    node->value = -1;
    node->next = NULL;
    
    insertSingleAcyclicList(&l1, node);
    insertSingleAcyclicList(&l2, node);
    
    
    for (int i=5; i<9; i++) {
        insertSingleAcyclicListToLast(&l1, i);
    }
    
    // 追加l2之前,l1数据
//    printListNode(l1);
    
    for (int i=18; i<21; i++) {
        insertSingleAcyclicListToLast(&l2, i);
    }
    
    printListNode(l1);
    printListNode(l2);
    
    ListNode target = getIntersectionNode(&l1, &l2);
    
    printListNode(target);
}



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        test();
        
        
    }
    return 0;
}
