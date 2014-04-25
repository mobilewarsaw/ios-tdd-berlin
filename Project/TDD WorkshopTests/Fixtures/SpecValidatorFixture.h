#import <Foundation/Foundation.h>
#import "Validating.h"


@interface SpecValidatorFixture : NSObject <Validating>
@property(nonatomic) BOOL didCallValidateText;
@property(nonatomic) BOOL infoMethodCalled;
@end
