//
//  Copyright (c) 2014 Mobile Warsaw. All rights reserved.
//


#import "AgendaProvider.h"
#import "Speaker.h"
#import "AgendaItem.h"


@interface AgendaProvider ()
@property(nonatomic, readwrite) NSArray *agendaItems;
@end

@implementation AgendaProvider

- (id)init {
    self = [super init];
    if (self) {
        _agendaItems = [self _loadAgenda];
    }
    return self;
}

- (void)reloadAgendaWithCompletionHandler:(void (^)(void))completionHandler {
    typeof(self) __block __weak weakSelf = self;
    dispatch_async(dispatch_get_global_queue(2, 0), ^{
        typeof(weakSelf) strongSelf = weakSelf;
        strongSelf.agendaItems = [strongSelf _loadAgenda];
        if (completionHandler) {
            completionHandler();
        }
    });
}

#pragma mark - Private

- (NSArray *)_loadAgenda {
    NSString *speakersPath = [[NSBundle mainBundle] pathForResource:@"Agenda" ofType:@"JSON"];
    NSData *speakersData = [NSData dataWithContentsOfFile:speakersPath];
    NSArray *JSONAgendaItems = [NSJSONSerialization JSONObjectWithData:speakersData options:0 error:nil];

    NSMutableArray *agendaItems = [NSMutableArray array];

    for (NSDictionary *JSONAgendaItem in JSONAgendaItems) {
        NSMutableArray *speakers = [NSMutableArray array];
        for (NSString *JSONSpeakerName in JSONAgendaItem[@"speakers"]) {
            Speaker *speaker = [[Speaker alloc] initWithName:JSONSpeakerName photo:nil ];
            [speakers addObject:speaker];
        }

        AgendaItem *agendaItem = [AgendaItem itemWithTitle:JSONAgendaItem[@"title"]
                                                      type:(AgendaItemType) [JSONAgendaItem[@"type"] integerValue]
                                                 startDate:[NSDate dateWithTimeIntervalSince1970:[JSONAgendaItem[@"startDate"] doubleValue]]
                                                  duration:[JSONAgendaItem[@"duration"] doubleValue]
                                                  speakers:speakers];
        [agendaItems addObject:agendaItem];
    }

    return agendaItems;
}

@end
