//
//  LinkedList.c
//  链表
//
//  Created by 李泽宇 on 2020/4/13.
//  Copyright © 2020 xbcs. All rights reserved.
//

#include "LinkedList.h"







Status createSingleLinkListWithHead(ListNode *l)
{
    if (*l) {
        return Error;
    }
    
    *l = (ListNode)malloc(sizeof(Node));
    
    (*l)->value = Head;
    (*l)->next = NULL;

    return OK;
}

Status createSingleLinkListNoHead(ListNode *l, int data)
{
    if (*l) {
        return Error;
    }
    
    *l = (ListNode)malloc(sizeof(Node));
    (*l)->value = data;
    (*l)->next = NULL;

    return OK;
}


Status insertSingleLinkListToHead(ListNode *l, int value)
{
    
    if ((*l) == NULL) {
        return Error;
    }
    
    ListNode temp = (ListNode)malloc(sizeof(Node));
    temp->value = value;
    
    if ((*l)->value == Head) {
        if ((*l)->next == NULL) {
            temp->next = NULL;
            (*l)->next = temp;
        }
        else
        {
            temp->next = (*l)->next;
            (*l)->next = temp;
        }
    }
    else
    {
//        if ((*l)->next == NULL) {
            temp->next = *l;
            *l = temp;
//        } else.
    }
    
    return OK;
}


Status insertSingleLinkListToLast(ListNode *l, int value)
{
    if ((*l) == NULL) {
        return Error;
    }
    
    ListNode temp = *l;
    if ((*l)->value == Head) {
        
        while (temp->next != NULL)
        {
            temp = temp->next;
        }
        
        ListNode newList = (ListNode)malloc(sizeof(Node));
        newList->value = value;
        newList->next = NULL;
        
        temp->next = newList;
        
        return OK;
    }
    else
    {
        
        for(temp=*l; temp->next != NULL; temp=temp->next);
        
        ListNode newList = (ListNode)malloc(sizeof(Node));
        newList->value = value;
        newList->next = NULL;
        
        temp->next = newList;
        
        return OK;
    }

}


Status createCircularLists(ListNode *l, int data)
{
    if ((*l)!=NULL) {
        return Error;
    }
    
    *l = (ListNode)malloc(sizeof(Node));
    (*l)->value = data;
    (*l)->next = *l;
    
    return OK;
}



Status insertCircularListsToHead(ListNode *l, int data)
{
    if ((*l) == NULL) {
        return Error;
    }
    
    ListNode newNode = (ListNode)malloc(sizeof(Node));
    newNode->value = data;
    newNode->next = (*l);
    
    ListNode temp;
    for (temp = *l; temp->next != *l; temp = temp->next);
    
    temp->next = newNode;
    
    (*l) = newNode;
    
    return OK;
}


Status insertCircularListsToLast(ListNode *l, int data)
{
    if ((*l) == NULL) {
        return Error;
    }
    
    ListNode newNode = (ListNode)malloc(sizeof(Node));
    newNode->value = data;
    newNode->next = *l;
    
    ListNode temp;
    for (temp = *l; temp->next != *l; temp = temp->next);
    
    temp->next = newNode;
    
    return OK;
}


Status insertCircularListsAtIndex(ListNode *l, int index, int data)
{
    if ((*l) == NULL) {
        return Error;
    }
    
    int i = 0;
    
    ListNode temp;
    
    for (temp = *l; i<index-1; temp = temp->next, i++);
    
    ListNode newNode = (ListNode)malloc(sizeof(Node));
    
    newNode->value = data;
    newNode->next = temp->next;
    
    temp->next = newNode;
    
    return OK;
}


void printListNode(ListNode l)
{
    ListNode temp = l;
    
    
    
    
    
    while (temp != NULL && temp->next!=l) {
        
        if (temp) {
            printf("%3d", temp->value);
        }
        
        temp = temp->next;
    }
    if (temp && temp->next == l) {
        printf("%3d", temp->value);
    }
    
    printf("\n");
}
