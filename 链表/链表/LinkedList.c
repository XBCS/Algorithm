//
//  LinkedList.c
//  链表
//
//  Created by 李泽宇 on 2020/4/13.
//  Copyright © 2020 xbcs. All rights reserved.
//

#include "LinkedList.h"

#define Max_Size 1000

struct LinkNodeArray
{
    ListNode* node;
    int len;
};

typedef struct LinkNodeArray* NodeArray;




Status createDoubleAcyclicList(ListNode *l, int data)
{
    
    if (*l != NULL) {
        return Error;
    }
    
    *l = (ListNode)malloc(sizeof(Node));
    
    if (*l == NULL) {
        return Error;
    }
    
    (*l)->value = data;
    (*l)->prior = NULL;
    (*l)->next = NULL;
    
    return OK;
}

Status createDoubleCircularList(ListNode *l, int data)
{
    
    if (*l != NULL) {
        return Error;
    }
    
    *l = (ListNode)malloc(sizeof(Node));
    
    if (*l == NULL) {
        return Error;
    }
    
    (*l)->value = data;
    (*l)->prior = *l;
    (*l)->next = *l;
    
    return OK;
}



Status createSingleAcyclicListWithHead(ListNode *l)
{
    if (*l) {
        return Error;
    }
    
    *l = (ListNode)malloc(sizeof(Node));
    
    if (*l == NULL) {
        return Error;
    }
    
    (*l)->value = Head;
    (*l)->next = NULL;

    return OK;
}

Status createSingleAcyclicListListNoHead(ListNode *l, int data)
{
    if (*l) {
        return Error;
    }
    
    *l = (ListNode)malloc(sizeof(Node));
    if (*l == NULL) {
        return Error;
    }
    (*l)->value = data;
    (*l)->next = NULL;

    return OK;
}


Status addToDoubleAcyclicList(ListNode *l, int data)
{
    if ((*l) == NULL) {
        createDoubleAcyclicList(l, data);
        return OK;
    }
    
    ListNode temp;
    ListNode newNode;
    
    for (temp = *l; temp->next != NULL; temp = temp->next);
    
    newNode = (ListNode)malloc(sizeof(Node));
    newNode->value = data;
    newNode->next = NULL;
    
    newNode->prior = temp;
    
    temp->next = newNode;
    
    return OK;
}
//createDoubleCircularList
Status addToDoubleCircularList(ListNode *l, int data)
{
    
    if ((*l)==NULL) {
        createDoubleCircularList(l, data);
        return OK;
    }
    
    ListNode temp, newNode = NULL;
    
    for (temp = *l; temp->next != *l; temp = temp->next);
    
    newNode = (ListNode)malloc(sizeof(Node));
    
    newNode->value = data;
    
    newNode->prior = temp;
    temp->next = newNode;
    
    newNode->next = *l;
    (*l)->prior = newNode;
    
    return OK;
}


Status insertDoubleCircularListAtIndex(ListNode *l, int index, int data)
{
    if ((*l) == NULL) {
        createDoubleCircularList(l, data);
        return OK;
    }
    
    // todo

    
    
    
    return OK;
}



Status insertSingleAcyclicListToHead(ListNode *l, int value)
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


Status insertSingleAcyclicList(ListNode *l, ListNode node)
{
    
    if (node == NULL) {
        return Error;
    }
    
    if ((*l) == NULL) {
        *l = node;
        return OK;
    }
    
    ListNode temp;
    // 有头
    if ((*l)->value == Head) {
        temp = (*l)->next;
    } else
    {
        temp = *l;
    }
    
    if (temp == NULL) {
        (*l)->next = node;
        return OK;
    }
    
    for (; temp->next != NULL; temp= temp->next);
    
    temp->next = node;
    
    return OK;
    
}


Status insertSingleAcyclicListToLast(ListNode *l, int value)
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


Status createSingleCircularList(ListNode *l, int data)
{
    if ((*l)!=NULL) {
        return Error;
    }
    
    *l = (ListNode)malloc(sizeof(Node));
    (*l)->value = data;
    (*l)->next = *l;
    
    return OK;
}



Status insertSingleCircularListToHead(ListNode *l, int data)
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


Status insertSingleCircularListToLast(ListNode *l, int data)
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


Status insertSingleCircularListAtIndex(ListNode *l, int index, int data)
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







int getPlaceWithContainerElement(NodeArray nodeArray, ListNode node)
{
    
    for (int i = 0; i < nodeArray->len; i++) {
        
        ListNode temp = nodeArray->node[i];
        if (temp == node) {
            return i;
        }
    }
    
    return -1;
}


void printListNode(ListNode l)
{
    
    // 只满足单链表及从头开始的环形链表, 不满足蝌蚪状环形链表的打印.
//    ListNode temp = l;
//
//    while (temp != NULL && temp->next!=l) {
//
//        if (temp) {
//            printf("%3d", temp->value);
//        }
//
//        temp = temp->next;
//    }
//    if (temp && temp->next == l) {
//        printf("%3d", temp->value);
//    }
    
    if (l == NULL) {
        printf("\n 链表为: NULL \n");
        return;
    }
    
    NodeArray nodeArray = (NodeArray)malloc(sizeof(struct LinkNodeArray));
    
    nodeArray->node = (ListNode*)malloc(sizeof(ListNode) * Max_Size);
    nodeArray->len = 0;
    
    
    ListNode temp = l;
    int i = 0;
    int place = -1;
    while (temp) {
        place = getPlaceWithContainerElement(nodeArray, temp);
        if (place == -1) {
            nodeArray->node[i] = temp;
            nodeArray->len++;
        } else
        {
            break;
        }
        temp = temp->next;
        i++;
    }
    
    for (int j = 0; j<nodeArray->len; j++) {
        printf("%4d", nodeArray->node[j]->value);
    }
    
    if (place != -1) {
        printf("%4d", nodeArray->node[place]->value);
    }
    
    printf("\n");
    
    free(nodeArray->node);
    free(nodeArray);
}
