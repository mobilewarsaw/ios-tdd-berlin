//
// Copyright (c) 2014 Mobile Warsaw. All rights reserved.
//


#import <Foundation/Foundation.h>


@interface FakeAgendaProvider : NSObject

@property(nonatomic, strong) NSArray *agendaItems;



@property(nonatomic) BOOL reloadAgendaCalled;
@property(nonatomic, copy) void (^reloadCompletionHandler)();

- (void)reloadAgendaWithCompletionHandler:(void (^)(void))completionHandler;

@end
