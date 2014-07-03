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

        __block UICollectionView *collectionView;

        beforeEach(^{
            collectionView = (UICollectionView *) streamItemPreviewViewController.view;
        });

        it(@"should be collection view", ^{
            expect(streamItemPreviewViewController.view).to.beKindOf([UICollectionView class]);
        });

        it(@"should have white background color", ^{
            expect(streamItemPreviewViewController.view.backgroundColor).to.equal([UIColor whiteColor]);
        });

        it(@"should have custom layout", ^{
            expect(collectionView.collectionViewLayout).to.beKindOf([StreamItemPreviewLayout class]);
        });

        it(@"should have paging enabled", ^{
            expect(collectionView.pagingEnabled).to.beTruthy();
        });

        it(@"should be horizontally scrollable", ^{
            StreamItemPreviewLayout *streamItemPreviewLayout = (StreamItemPreviewLayout *) collectionView.collectionViewLayout;
            expect(streamItemPreviewLayout.scrollDirection).to.equal(UICollectionViewScrollDirectionHorizontal);
        });

    });

});
SPEC_END