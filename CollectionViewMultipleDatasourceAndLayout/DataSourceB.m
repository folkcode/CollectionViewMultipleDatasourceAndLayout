//
// Created by Minh Tu Le on 5/1/14.
// Copyright (c) 2014 Minh Tu Le. All rights reserved.
//



#import "DataSourceB.h"


@implementation DataSourceB

- (instancetype)init {
    self = [super init];

    if (!self) {
        return nil;
    }

    self.items = @[
            [[UIColor purpleColor] colorWithAlphaComponent:0.5],
            [[UIColor yellowColor] colorWithAlphaComponent:0.5],
            [[UIColor brownColor] colorWithAlphaComponent:0.5],
            [[UIColor cyanColor] colorWithAlphaComponent:0.5],
            [[UIColor magentaColor] colorWithAlphaComponent:0.5],
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