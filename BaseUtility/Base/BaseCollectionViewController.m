//
//  BaseCollectionViewController.m
//  BaseTools
//
//  Created by 李雪阳 on 2019/3/29.
//  Copyright © 2019 Singularity. All rights reserved.
//

#import "BaseCollectionViewController.h"

@interface BaseCollectionViewController ()

@end

@implementation BaseCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initCollectionView];
}

- (void)setFlowLayout:(UICollectionViewFlowLayout *)flowLayout {
    _flowLayout = flowLayout;
    self.collectionView.collectionViewLayout = flowLayout;
}

- (void)initCollectionView {
    
    UICollectionViewFlowLayout *layout = nil;
    if (self.flowLayout) {
        layout = self.flowLayout;
    }else {
        layout = [UICollectionViewFlowLayout new];
        layout.minimumLineSpacing= 10;
        layout.minimumInteritemSpacing= 10;
    }
    
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WINDOW_HEIGHT) collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_collectionView = collectionView];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    
    if (@available(iOS 11.0, *)) {
        collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"baseCollectionViewCell"];
}




- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(50, 50);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"baseCollectionViewCell" forIndexPath:indexPath];
    if (!cell) {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"baseCollectionViewCell" forIndexPath:indexPath];
    }
    
    cell.backgroundColor = [UIColor lightGrayColor];
    
    return cell;
}


- (void)dealloc {
    self.collectionView.delegate = nil;
    self.collectionView.dataSource = nil;
}



@end
