//
//  Copyright (c) 2014 Mobile Warsaw. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "AgendaItem.h"


@interface AgendaProvider : NSObject
@property(nonatomic, readonly) NSArray *agendaItems;

- (void)reloadAgendaWithCompletionHandler:(void(^)(void))completionHandler;

@end
