//
//  main.m
//  binaryTree
//
//  Created by mac on 16/5/9.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef int  elemType;

typedef struct binary{
    elemType data;
    struct binary *leftchild;
    struct binary *rightchild;
}BinaryTree;

BinaryTree * initWithTree(BinaryTree *bt){
    bt = (BinaryTree *)malloc(sizeof(BinaryTree));
    bt->data = 5;
    bt->leftchild = NULL;
    bt->rightchild = NULL;
    return bt;
}


void insertWithTree(BinaryTree *bt,elemType e) {
    BinaryTree *p = (BinaryTree *)malloc(sizeof(BinaryTree));
    p->data = e;
    p->leftchild = NULL;
    p->rightchild = NULL;
    if (bt == NULL) {
        bt = p;
    }
    if (bt->leftchild == NULL && e < (bt->data)) {
        bt->leftchild = p;
        printf("%d ",e);
        return;
    }
    if (bt->rightchild == NULL && e > (bt->data)) {
        printf("%d ",e);
        bt->rightchild = p;
        return;
    }
    
    if (e < bt->data) {
        insertWithTree(bt->leftchild, e);
    }
    if (e > bt->data) {
        insertWithTree(bt->rightchild, e);
    }
}

void middlePrintf(BinaryTree *bt){
    if (bt == NULL) {
        return;
    }else{
        middlePrintf(bt->leftchild);
        printf("%d ",bt->data);
        middlePrintf(bt->rightchild);
    }
}


void frontPrintf(BinaryTree *bt) {
    if (bt == NULL) {
        return;
    }else{
        printf("%d ",bt->data);
        
        frontPrintf(bt->leftchild);
        frontPrintf(bt->rightchild);

    }
    
}

void behindPrintf(BinaryTree *bt) {
    if (bt == NULL) {
        return;
    }else{
        behindPrintf(bt->rightchild);
        printf("%d ",bt->data);
        behindPrintf(bt->leftchild);
    }
}

BinaryTree * deleteElement (BinaryTree *bt ,elemType e){
    BinaryTree *search = (BinaryTree *)malloc(sizeof(BinaryTree));
    BinaryTree *parent = (BinaryTree *)malloc(sizeof(BinaryTree));
    search = bt;
    parent = bt;
    while (search->data != e) {
        if (search->leftchild == NULL && search->rightchild == NULL) {
            printf("不存在");
            return bt;
        }
        
        if (e < search->data) {
            parent = search;
            search = search->leftchild;
        }else if (e > search->data){
            parent = search;
            search = search->rightchild;
        }else{
            break;
        }
    }
    if (search->leftchild == NULL && search->rightchild == NULL) {
        if (bt->leftchild == NULL && bt->rightchild == NULL) {
            free(bt);
            bt = NULL;
        }else{
            if (search->data < parent->data) {
                parent->leftchild = NULL;
            }else{
                parent->rightchild = NULL;
            }
            free(search);
            search = NULL;
        }
        
        return bt;
    }
    
    if (search->leftchild != NULL && search->rightchild == NULL) {
        if (search->data < parent->data) {
            parent->leftchild = search->leftchild;
        }else{
            parent->rightchild = search->leftchild;
        }
        free(search);
        search = NULL;
        return  bt;
    }
    
    if (search->leftchild == NULL && search->rightchild != NULL) {
        if (search->data < parent->data) {
            parent->leftchild = search->rightchild;
        }else{
            parent->rightchild = search->rightchild;
        }
        free(search);
        search = NULL;
        return  bt;
    }
    
    if (search->leftchild != NULL && search->rightchild != NULL) {
        BinaryTree *next = (BinaryTree *)malloc(sizeof(BinaryTree));;
        BinaryTree *nextParent = (BinaryTree *)malloc(sizeof(BinaryTree));;
        nextParent = search;
        next = search->rightchild;
        while (next->leftchild != NULL) {
            nextParent = next;
            next = search->leftchild;
        }
        if (next->data < nextParent->data) {
            nextParent->leftchild = next->rightchild;
        }else{
            nextParent->rightchild = next->rightchild;
        }
        search->data = next->data;
        free(next);
        next = NULL;
        return bt;
    }
    return  bt;
}


int main(int argc, const char * argv[]) {
    

        
    BinaryTree *bt;
    bt = initWithTree(bt);
    for (int i = 0; i < 10; i++) {
        insertWithTree(bt, arc4random() % 10);
    }
    printf("\n");
    middlePrintf(bt);
    printf("\n");
    frontPrintf(bt);
    printf("\n");
    behindPrintf(bt);
//    deleteElement(bt, 2);
    printf("\n");
//    middlePrintf(bt);
    
    
    return 0;
}
