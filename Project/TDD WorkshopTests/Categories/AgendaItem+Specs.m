//
// Copyright (c) 2014 Mobile Warsaw. All rights reserved.
//

#import "AgendaItem+Specs.h"


@implementation AgendaItem (Specs)

+ (instancetype)fixture {
    AgendaItem *agendaItem = [[self alloc] initWithTitle:@"test title"
                                                    type:AgendaItemTypeLecture
                                               startDate:[NSDate dateWithTimeIntervalSince1970:1]
                                                duration:60
                                                speakers:nil];
    return agendaItem;
}

@end
