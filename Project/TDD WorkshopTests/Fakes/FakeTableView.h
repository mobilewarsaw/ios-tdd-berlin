//
// Copyright (c) 2014 Mobile Warsaw. All rights reserved.
//


#import <Foundation/Foundation.h>


@interface FakeTableView : UITableView

@property(nonatomic, assign) Class registeredClass;
@property(nonatomic, copy) NSString *registeredIndentifier;

- (void)registerClass:(Class)cellClass forCellReuseIdentifier:(NSString *)identifier;


@property(nonatomic, strong) UITableViewCell *cellToDequeue;

- (id)dequeueReusableCellWithIdentifier:(NSString *)identifier;

@end
