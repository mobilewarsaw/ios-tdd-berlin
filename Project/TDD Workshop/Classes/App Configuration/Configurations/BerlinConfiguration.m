//  
//  Copyright (c) 2014 Mobile Warsaw All rights reserved.
//  


#import "BerlinConfiguration.h"


@implementation BerlinConfiguration
@synthesize parseApplicationId, parseClientId;

#pragma mark - Object life cycle

- (id)init {
    self = [super init];
    if (self) {
        self.parseApplicationId = @"mi0gbnDuIQBlaK6SGMRYWNoXyRxdX4QKR8xZF2c9";
        self.parseClientId = @"9784XYheCXdnJUL62PmxcnARFMsVPG8suTHCZjaA";
    }
    return self;
}

@end