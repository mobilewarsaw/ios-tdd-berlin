//
//  Copyright (c) 2014 Mobile Warsaw. All rights reserved.
//

#import "AgendaViewController.h"
#import "AgendaProvider.h"
#import "AgendaTableViewCell.h"


@implementation AgendaViewController

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        self.tabBarItem.image = [UIImage imageNamed:@"agenda"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

@end
