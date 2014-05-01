//
//  ViewController.m
//  CollectionViewMultipleDatasourceAndLayout
//
//  Created by Minh Tu Le on 5/1/14.
//  Copyright (c) 2014 Minh Tu Le. All rights reserved.
//

#import "ViewController.h"
#import "LayoutA.h"
#import "DataSourceA.h"
#import "LayoutB.h"
#import "DataSourceB.h"
#import "EmptyDataSource.h"

@interface ViewController () <UICollectionViewDelegate>

@property(nonatomic, strong) UICollectionView *collectionView;
@property(nonatomic, strong) NSObject<UICollectionViewDataSource> *dataSource;
@property(nonatomic, strong) UICollectionViewLayout *layout;
@property(nonatomic) NSInteger dice;

@end

@implementation ViewController

#pragma mark - init

- (void)setDataSource:(NSObject <UICollectionViewDataSource> *)dataSource {
    if (dataSource != _dataSource) {
        _dataSource = dataSource;
        self.collectionView.dataSource = dataSource;
    }
}

- (void)setLayout:(UICollectionViewLayout *)layout {
    if (layout != _layout) {
        _layout = layout;
        self.collectionView.collectionViewLayout = layout;
    }
}


#pragma mark - public

- (void)viewDidLoad {
    [super viewDidLoad];

    [self _initCollectionView];
    self.dice = 1;

    [NSTimer scheduledTimerWithTimeInterval:2
                                     target:self
                                   selector:@selector(_refresh)
                                   userInfo:nil
                                    repeats:YES];
}

- (void)_initCollectionView {
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 20, 1024, 748)
                                             collectionViewLayout:[[LayoutA alloc] init]];
    self.dataSource = [[DataSourceA alloc] init];
    self.collectionView.delegate = self;

    [self.collectionView registerClass:[UICollectionViewCell class]
            forCellWithReuseIdentifier:@"item"];

    self.collectionView.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:self.collectionView];
}

- (void)_refresh {
    // this doesn't work
    self.dataSource = [[EmptyDataSource alloc] init];
    [self.layout invalidateLayout];
    if (self.dice) {
        self.layout = [[LayoutB alloc] init];
        self.dataSource = [[DataSourceB alloc] init];
    } else {
        self.layout = [[LayoutA alloc] init];
        self.dataSource = [[DataSourceA alloc] init];
    }

    // this should work
//    [self.collectionView removeFromSuperview];
//    [self _initCollectionView];
//    if (self.dice) {
//        self.layout = [[LayoutB alloc] init];
//        self.dataSource = [[DataSourceB alloc] init];
//    } else {
//        self.layout = [[LayoutA alloc] init];
//        self.dataSource = [[DataSourceA alloc] init];
//    }

    self.dice = 1 - self.dice;
}

@end