#import "RootTabBarController.h"
#import "SpeakersViewController.h"
#import "PhotoStreamViewController.h"
#import "AgendaViewController.h"
#import "PollViewController.h"
#import "PollManager.h"
#import "AgendaProvider.h"


@implementation RootTabBarController

- (void)awakeFromNib {
    [super awakeFromNib];

    SpeakersViewController *speakersViewController = [SpeakersViewController new];
    UINavigationController *speakersNavigationController = [[UINavigationController alloc] initWithRootViewController:speakersViewController];

    PhotoStreamViewController *photoStreamViewController = [PhotoStreamViewController new];
    UINavigationController *photoStreamNavigationController = [[UINavigationController alloc] initWithRootViewController:photoStreamViewController];

    AgendaViewController *agendaViewController = [AgendaViewController new];
    UINavigationController *agendaNavigationController = [[UINavigationController alloc] initWithRootViewController:agendaViewController];

    PollViewController *pollController = [[PollViewController alloc] initWithPollManager:[PollManager sharedInstance]
                                                                          agendaProvider:[AgendaProvider new]];
    UINavigationController *pollNavigationController = [[UINavigationController alloc] initWithRootViewController:pollController];

    self.viewControllers = @[speakersNavigationController, photoStreamNavigationController, agendaNavigationController, pollNavigationController];
}

@end
