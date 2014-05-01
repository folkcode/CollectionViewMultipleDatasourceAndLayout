//
// Created by Minh Tu Le on 5/1/14.
// Copyright (c) 2014 Minh Tu Le. All rights reserved.
//



#import "EmptyDataSource.h"


@implementation EmptyDataSource

- (instancetype)init {
    self = [super init];

    if (!self) {
        return nil;
    }


    return self;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 0;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
              cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"item"
                                                                           forIndexPath:indexPath];
//    cell.backgroundColor = self.items[indexPath.item];
    return cell;
}

@end