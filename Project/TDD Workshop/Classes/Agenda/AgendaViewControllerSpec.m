#import "Specs.h"

#import "AgendaViewController.h"
#import "AgendaProvider.h"
#import "AgendaTableViewCell.h"
#import "FakeTableView.h"
#import "FakeAgendaProvider.h"
#import "AgendaItem+Specs.h"

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
        it(@"should have a agenda image", ^{
            expect(viewController.tabBarItem.selectedImage).to.equal([UIImage imageNamed:@"agenda.png"]);
        });
        
        it(@"should have a 'Agenda' title", ^{
            expect(viewController.tabBarItem.title).to.equal(@"Agenda");
        });
    });

    describe(@"setup", ^{
        it(@"should initialize agenda provider", ^{
            expect(viewController.agendaProvider).to.beKindOf([AgendaProvider class]);
        });
    });

    describe(@"view loads", ^{
        __block FakeAgendaProvider *fakeAgendaProvider;
        beforeEach(^{
            // Arrange
            fakeAgendaProvider = [FakeAgendaProvider new];
            viewController.agendaProvider = (id) fakeAgendaProvider;

            //Act
            [viewController viewDidLoad];
        });

        it(@"should schedule agenda reload", ^{
            expect(fakeAgendaProvider.reloadAgendaCalled).to.beTruthy();
        });

        context(@"when agenda reloading completes", ^{
            __block FakeTableView *fakeTableView;
            beforeEach(^{
                fakeTableView = [FakeTableView new];
                viewController.view = fakeTableView;
                //Simulate
                [fakeAgendaProvider simulateCompletionWithNewAgendaItems:@[[AgendaItem fixture]]];
            });

            it(@"should reload table view", ^{
                //Assert
                expect(fakeTableView.reloadDataCalled).to.beTruthy();
            });
        });
    });

    describe(@"table view", ^{
        __block UITableView *tableView;
        __block FakeAgendaProvider *fakeAgendaProvider;
        beforeEach(^{
            tableView = viewController.tableView;

            fakeAgendaProvider = [FakeAgendaProvider new];
            viewController.agendaProvider = (id) fakeAgendaProvider;
        });

        context(@"when there is not items", ^{
            beforeEach(^{
                fakeAgendaProvider.agendaItems = @[];
            });

            it(@"should have 0 cell", ^{
                expect([tableView.dataSource tableView:tableView numberOfRowsInSection:0]).to.equal(0);
            });
        });

        context(@"when there is 2 items", ^{
            beforeEach(^{
                fakeAgendaProvider.agendaItems = @[[AgendaItem new], [AgendaItem new]];
            });

            it(@"should have 2 items for first section", ^{
                expect([tableView.dataSource tableView:tableView numberOfRowsInSection:0]).to.equal(2);
            });
        });

        it(@"should have 1 section", ^{
            NSInteger numberOfSections = [viewController.tableView numberOfSections];
            expect(numberOfSections).to.equal(1);
        });
        
        it(@"should return cell for each item", ^{
            for (int i = 0; i < 2; ++i) {
                NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
                AgendaTableViewCell *cell = (AgendaTableViewCell *) [tableView.dataSource tableView:tableView cellForRowAtIndexPath:indexPath];
                expect(cell).to.beInstanceOf([AgendaTableViewCell class]);
            }
        });

        context(@"cell setup", ^{
            beforeEach(^{
                //Arrange
                AgendaItem *agendaItemFixture = [AgendaItem fixture];
                fakeAgendaProvider.agendaItems = @[agendaItemFixture];
            });

            it(@"should setup cell with AgendaItem properties", ^{
                //Act
                NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:0];
                AgendaTableViewCell *cell = (AgendaTableViewCell *) [tableView.dataSource tableView:tableView
                                                                              cellForRowAtIndexPath:indexPath];


                //Assert
                expect(cell.textLabel.text).to.equal(@"test title");
            });
        });
    });

    afterEach(^{
        viewController = nil;
    });
});

SPEC_END
