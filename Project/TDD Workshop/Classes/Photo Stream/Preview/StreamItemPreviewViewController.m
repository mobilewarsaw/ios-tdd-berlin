//  
//  Copyright (c) 2014 Mobile Warsaw All rights reserved.
//  


#import "StreamItemPreviewViewController.h"
#import "StreamItem.h"
#import "StreamItemPreviewLayout.h"


NSString *const kCellId = @"kCellId";

@interface StreamItemPreviewViewController ()
@end

@implementation StreamItemPreviewViewController

#pragma mark - Object life cycle

- (id)initWithStreamItems:(NSArray *)streamItems {
    self = [super init];
    if (self) {
        self.streamItems = streamItems;
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                                               target:self
                                                                                               action:@selector(doneBarButtonPressed:)];
    }
    return self;
}

#pragma mark - View life cycle

- (void)loadView {
    StreamItemPreviewLayout *flowLayout = [StreamItemPreviewLayout new];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    [self setupCollectionView:collectionView];
    self.view = collectionView;
}

- (void)setupCollectionView:(UICollectionView *)collectionView {
    collectionView.pagingEnabled = YES;
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.dataSource = self;
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:kCellId];
}

#pragma mark - Actions

- (void)doneBarButtonPressed:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.streamItems count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellId forIndexPath:indexPath];
    StreamItem *streamItem = self.streamItems[(NSUInteger) indexPath.item];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[streamItem image]];
    cell.backgroundView = imageView;
    cell.backgroundView.contentMode = UIViewContentModeScaleAspectFit;
    return cell;
}


@end