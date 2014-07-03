//  
//  Copyright (c) 2014 Mobile Warsaw All rights reserved.
//  


#import "StreamItemPreviewViewController.h"
#import "StreamItem.h"
#import "StreamItemPreviewLayout.h"


@implementation StreamItemPreviewViewController

#pragma mark - Object life cycle

- (instancetype)initWithStreamItem:(StreamItem *)streamItem {
    self = [super init];
    if (self) {
        self.streamItem = streamItem;
        self.title = self.streamItem.title;
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                                               target:self
                                                                                               action:@selector(doneBarButtonPressed:)];
    }
    return self;
}

+ (instancetype)controllerWithStreamItem:(StreamItem *)streamItem {
    return [[self alloc] initWithStreamItem:streamItem];
}

#pragma mark - View life cycle

- (void)loadView {
    StreamItemPreviewLayout *flowLayout = [StreamItemPreviewLayout new];
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    collectionView.backgroundColor = [UIColor whiteColor];
    self.view = collectionView;
}

#pragma mark - Actions

- (void)doneBarButtonPressed:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end