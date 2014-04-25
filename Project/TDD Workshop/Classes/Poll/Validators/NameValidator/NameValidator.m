#import "NameValidator.h"


@implementation NameValidator

- (BOOL)validateText:(NSString *)text {
    BOOL decimalDigitCharactersFound = [text rangeOfCharacterFromSet:[NSCharacterSet decimalDigitCharacterSet]].location != NSNotFound;
    BOOL isNotValid = text.length > 0 && decimalDigitCharactersFound;
    return !isNotValid;
}

- (NSString *)info {
    return @"Wrong characters!";
}

@end
