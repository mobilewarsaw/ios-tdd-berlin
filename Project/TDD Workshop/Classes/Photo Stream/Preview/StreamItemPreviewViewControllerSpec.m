#import "Specs.h"
#import "StreamItemPreviewViewController.h"
#import "StreamItemPreviewLayout.h"
#import "StreamItem.h"

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

        it(@"should have data source set", ^{
            expect(collectionView.dataSource).to.equal(streamItemPreviewViewController);
        });

    });

    describe(@"when created with items", ^{

        __block NSArray *streamItems;
        __block UICollectionView *collectionView;

        beforeEach(^{
            streamItems = @[ [StreamItem new], [StreamItem new], [StreamItem new] ];
            streamItemPreviewViewController = [[StreamItemPreviewViewController alloc] initWithStreamItems:streamItems];
            collectionView = (UICollectionView *) streamItemPreviewViewController.view;
        });

        it(@"should return number of cells equal to provided list of items", ^{
            expect([streamItemPreviewViewController collectionView:collectionView numberOfItemsInSection:0]).to.equal([streamItems count]);
        });

        it(@"should return cell for each stream item", ^{
            for (int i = 0; i < [streamItems count]; ++i) {
                NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
                expect([streamItemPreviewViewController collectionView:collectionView cellForItemAtIndexPath:indexPath]).notTo.beNil();
            }
        });

        it(@"should return cells with background image view with proper content mode", ^{
            for (int i = 0; i < [streamItems count]; ++i) {
                NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
                UICollectionViewCell *cell = [streamItemPreviewViewController collectionView:collectionView cellForItemAtIndexPath:indexPath];
                expect(cell.backgroundView).to.beKindOf([UIImageView class]);
                expect(cell.backgroundView.contentMode).to.equal(UIViewContentModeScaleAspectFit);
            }
        });
    });

});
SPEC_END