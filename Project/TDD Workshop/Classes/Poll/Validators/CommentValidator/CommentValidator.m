#import "CommentValidator.h"


@implementation CommentValidator

- (BOOL)validateText:(NSString *)text {
    return text.length > 0 && text.length >= 10;
}

- (NSString *)info {
    return @"Less than 10 characters!";
}

@end
