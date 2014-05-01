//
// Created by Minh Tu Le on 5/1/14.
// Copyright (c) 2014 Minh Tu Le. All rights reserved.
//



#import "DataSourceA.h"


@implementation DataSourceA

- (instancetype)init {
    self = [super init];

    if (!self) {
        return nil;
    }

    self.items = @[
            [UIColor blueColor],
            [UIColor greenColor],
            [UIColor redColor],
    ];

    return self;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.items count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
              cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"item"
                                                                           forIndexPath:indexPath];
    cell.backgroundColor = self.items[indexPath.item];
    return cell;
}

@end