//
//  main.m
//  Q1
//
//  Created by 李泽宇 on 2020/4/13.
//  Copyright © 2020 xbcs. All rights reserved.
//


/*
 
 * 合并两个有序链表
      将两个升序链表合并为一个新的升序链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。

 * 示例：
         输入：1->2->4, 1->3->4
         输出：1->1->2->3->4->4
 
 */






#import <Foundation/Foundation.h>
#include "LinkedList.h"



ListNode mergeList1(ListNode *L1, ListNode *L2)
{
    
    if ((*L1) == NULL) {
        return *L2;
    }
    
    if ((*L2) == NULL) {
        return *L1;
    }
    
    ListNode head = NULL;
    ListNode temp, l1, l2;
    
    Status s = createSingleLinkListWithHead(&head);
    printf("%d \n", s);
    temp = head;
    l1 = (*L1)->next;
    l2 = (*L2)->next;
    
    while (l1 && l2) {
        
        if (l1->value < l2->value) {
            temp->next = l1;
            l1 = l1->next;
        } else
        {
            temp->next = l2;
            l2 = l2->next;
        }
        
        temp = temp->next;
    }
    
    if (l1 == NULL) {
        temp->next = l2;
    }
    
    if (l2 == NULL) {
        temp->next = l1;
    }
    
    return head;
}


ListNode mergeList2(ListNode *l1, ListNode *l2)
{
    if ((*l1) == NULL) {
        return *l2;
    }
    
    if ((*l2)== NULL) {
        return *l1;
    }
    
    ListNode temp1 , temp2;
    
    
    if ((*l1)->value == Head) {
        temp1 = (*l1)->next;
    }
    else
    {
        temp1 = *l1;
    }
    
    
    if ((*l2)->value == Head) {
        temp2 = (*l2)->next;
    }
    else
    {
        temp2 = *l2;
    }
    
    printf("\n l1->value: %d, l2->value: %d \n", (*l1)->value, (*l2)->value);
    
    if (temp1->value < temp2->value) {
        
        if ((*l1)->value == Head) {
            (*l1)->next->next = mergeList2(&temp1->next, &temp2);
        } else
        {
            (*l1)->next = mergeList2(&temp1->next, &temp2);
        }
        return *l1;
    }
    else
    {
        
        if ((*l2)->value == Head) {
            (*l2)->next->next = mergeList2(&temp1, &temp2->next);
        } else
        {
            (*l2)->next = mergeList2(&temp1, &temp2->next);
        }
        
        return *l2;
    }
    
    return NULL;
}



void initListNode(ListNode *L1, ListNode *L2)
{
    Status s;
    s = createSingleLinkListWithHead(L1);
    s = createSingleLinkListWithHead(L2);
    
    insertSingleLinkListToHead(L1, 5);
    insertSingleLinkListToHead(L1, 3);
    insertSingleLinkListToHead(L1, 1);
    insertSingleLinkListToHead(L1, 1);
    
    printListNode(*L1);
    
    
    insertSingleLinkListToHead(L2, 9);
    insertSingleLinkListToHead(L2, 8);
    insertSingleLinkListToHead(L2, 4);
    insertSingleLinkListToHead(L2, 1);
    printListNode(*L2);
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        ListNode L1 = NULL; // 有序链表 h 1 1 3 5
        ListNode L2 = NULL; // 有序俩表 h 1 4 8 9
        ListNode L3 = NULL; // 即将合成有序链表 h 1 1 1 3 4 5 8 9
        initListNode(&L1, &L2);

//        L3 = mergeList1(&L1, &L2);
        L3 = mergeList2(&L1, &L2);
        
        printListNode(L3);
        
    }
    return 0;
}
