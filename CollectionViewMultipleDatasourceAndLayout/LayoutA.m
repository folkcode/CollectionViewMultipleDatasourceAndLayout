//
// Created by Minh Tu Le on 5/1/14.
// Copyright (c) 2014 Minh Tu Le. All rights reserved.
//



#import "LayoutA.h"

@interface LayoutA ()

@property(nonatomic, strong) NSArray *frames;

@end


@implementation LayoutA

- (instancetype)init {
    self = [super init];
    if (!self) {
        return nil;
    }

    self.frames = @[
            [NSValue valueWithCGRect:CGRectMake(10, 10, 100, 100)],
            [NSValue valueWithCGRect:CGRectMake(200, 10, 200, 200)],
            [NSValue valueWithCGRect:CGRectMake(10, 300, 300, 300)],
    ];

    return self;
}

- (CGSize)collectionViewContentSize {
    return CGSizeMake(1024, 748);
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attributes.frame = [self.frames[indexPath.item] CGRectValue];
    return attributes;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSMutableArray *itemAttributes = [NSMutableArray array];

    [self.frames enumerateObjectsUsingBlock:^(NSValue *frameValue, NSUInteger index, BOOL *stop) {
        CGRect frame = [frameValue CGRectValue];
        if (CGRectIntersectsRect(frame, rect)) {
            [itemAttributes addObject:[self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:index
                                                                                                   inSection:0]]];
        }
    }];

    return itemAttributes;
}

@end