//
// Copyright (c) 2014 Mobile Warsaw. All rights reserved.
//


#import "FakeTableView.h"


@implementation FakeTableView

- (void)registerClass:(Class)cellClass forCellReuseIdentifier:(NSString *)identifier {
    self.registeredClass = cellClass;
    self.registeredIndentifier = identifier;
}

- (id)dequeueReusableCellWithIdentifier:(NSString *)identifier {
    return self.cellToDequeue;
}

@end
