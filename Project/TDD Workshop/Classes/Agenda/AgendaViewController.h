//
//  Copyright (c) 2014 Mobile Warsaw. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AgendaProvider;


@interface AgendaViewController : UITableViewController <UICollectionViewDelegate>

@property(nonatomic, strong) AgendaProvider *agendaProvider;

@end
