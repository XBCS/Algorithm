//
//  main.m
//  链表
//
//  Created by 李泽宇 on 2020/4/13.
//  Copyright © 2020 xbcs. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "LinkedList.h"




void singleListTest()
{
    ListNode l1=NULL, l2=NULL;
    

    createSingleLinkListWithHead(&l1);
    createSingleLinkListNoHead(&l2, 1);

    printListNode(l1);
    printListNode(l2);

    
    insertSingleLinkListToHead(&l1, 1);
    insertSingleLinkListToHead(&l1, 2);
    insertSingleLinkListToHead(&l1, 3);
    insertSingleLinkListToLast(&l1, 1);
    insertSingleLinkListToLast(&l1, 2);
    insertSingleLinkListToLast(&l1, 3);
    
    printListNode(l1);
    
    
    insertSingleLinkListToHead(&l2, 1);
    insertSingleLinkListToHead(&l2, 2);
    insertSingleLinkListToHead(&l2, 3);
    
    insertSingleLinkListToLast(&l2, 1);
    insertSingleLinkListToLast(&l2, 2);
    insertSingleLinkListToLast(&l2, 3);
    
    printListNode(l2);
}


void circularTest()
{
    ListNode l1 = NULL;
    
    createCircularLists(&l1, 1);
    
    
    printListNode(l1);
    
    insertCircularListsToHead(&l1, 2);
    printListNode(l1);
    insertCircularListsToHead(&l1, 3);
    printListNode(l1);
    
    insertCircularListsToLast(&l1, 3);
    printListNode(l1);
    insertCircularListsToLast(&l1, 2);
    printListNode(l1);
    insertCircularListsToLast(&l1, 1);
    printListNode(l1);
    
}



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        NSLog(@"Hello, World!");
        
        
//        singleListTest();
        circularTest();
        
        
    }
    return 0;
}
