#import "Specs.h"
#import "StreamItemPreviewViewController.h"
#import "StreamItemPreviewLayout.h"

SPEC_BEGIN(StreamItemPreviewViewControllerSpec)
describe(@"StreamItemPreviewViewController", ^{

    __block StreamItemPreviewViewController *streamItemPreviewViewController;

    beforeEach(^{
        streamItemPreviewViewController = [StreamItemPreviewViewController new];
    });

    afterEach(^{
        streamItemPreviewViewController = nil;
    });

    describe(@"when view is loaded", ^{

        it(@"should be collection view", ^{
            expect(streamItemPreviewViewController.view).to.beKindOf([UICollectionView class]);
        });

        it(@"should have white background color", ^{
            expect(streamItemPreviewViewController.view.backgroundColor).to.equal([UIColor whiteColor]);
        });

        it(@"should have custom layout", ^{
            UICollectionView *collectionView = (UICollectionView *) streamItemPreviewViewController.view;
            expect(collectionView.collectionViewLayout).to.beKindOf([StreamItemPreviewLayout class]);
        });

        it(@"should have paging enabled", ^{
            //TODO: Implement me!
            //Hint: check pagingEnabled property on collection view
        });

        it(@"should be horizontally scrollable", ^{
            //TODO: Implement me!
            //Hint: check scrollDirection on flow layout
        });
    });

});
SPEC_END