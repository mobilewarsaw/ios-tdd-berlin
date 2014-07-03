#import "Specs.h"

#import "AgendaViewController.h"
#import "AgendaProvider.h"
#import "AgendaTableViewCell.h"
#import "FakeTableView.h"
#import "FakeAgendaProvider.h"

SPEC_BEGIN(AgendaViewController)

describe(@"AgendaViewController", ^{
    __block AgendaViewController *viewController;

    beforeEach(^{
        viewController = [[AgendaViewController alloc] init];
    });
    
    describe(@"title", ^{
        it(@"should be set to 'Agenda'", ^{
            expect(viewController.title).to.equal(@"Agenda");
        });
    });
    
    describe(@"tab bar item", ^{
        it(@"should have a agenda image", PENDING);
        
        it(@"should have a 'Agenda' title", PENDING);
    });

    describe(@"setup", ^{
        it(@"should initialize agenda provider", PENDING);
    });

    describe(@"table view", ^{
        it(@"should have 1 section", ^{
            NSInteger numberOfSections = [viewController.tableView numberOfSections];
            expect(numberOfSections).to.equal(1);
        });
        
        it(@"should have 0 items for first section", PENDING);
    });

    afterEach(^{
        viewController = nil;
    });
});

SPEC_END
