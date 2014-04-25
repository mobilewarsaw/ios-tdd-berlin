#import "SpecValidatorFixture.h"


@implementation SpecValidatorFixture {

}

- (BOOL)validateText:(NSString *)text {
    self.didCallValidateText = YES;
    return NO;
}

- (NSString *)info {
    self.infoMethodCalled = YES;
    return @"InfoText";
}


@end
