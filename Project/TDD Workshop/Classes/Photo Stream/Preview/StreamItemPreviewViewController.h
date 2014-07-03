//  
//  Copyright (c) 2014 Mobile Warsaw All rights reserved.
//  


#import <Foundation/Foundation.h>

@class StreamItem;

@interface StreamItemPreviewViewController : UIViewController <UICollectionViewDataSource>

@property(nonatomic, strong) NSArray *streamItems;

- (id)initWithStreamItems:(NSArray *)streamItems;

@end