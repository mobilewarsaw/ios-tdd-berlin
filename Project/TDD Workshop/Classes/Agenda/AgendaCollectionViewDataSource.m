//
//  TDD Workshop
//
//  Created by Lukasz Warchol on 22/04/14.
//  Copyright (c) 2014 Mobile Warsaw. All rights reserved.
//


#import "AgendaCollectionViewDataSource.h"
#import "AgendaProvider.h"
#import "AgendaCollectionViewCell.h"

NSString *const AgendaCollectionViewCellIdentifier = @"AgendaCollectionViewCellId";

@implementation AgendaCollectionViewDataSource

- (id)initWithProvider:(AgendaProvider *)agendaProvider {
    self = [super init];
    if (self) {
        self.agendaProvider = agendaProvider;
    }
    return self;
}

- (void)setupWithCollectionView:(UICollectionView *)collectionView {
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [collectionView registerClass:[AgendaCollectionViewCell class]
       forCellWithReuseIdentifier:AgendaCollectionViewCellIdentifier];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.agendaProvider.agendaItems.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    AgendaCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:AgendaCollectionViewCellIdentifier
                                                                               forIndexPath:indexPath];

    AgendaItem *item = self.agendaProvider.agendaItems[(NSUInteger) indexPath.item];
    [cell configureForItem:item];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(CGRectGetWidth(collectionView.frame), 64);
}

@end
