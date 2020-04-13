#import "TelephoneFinder.h"

@implementation TelephoneFinder
- (NSArray <NSString*>*)findAllNumbersFromGivenNumber:(NSString*)number {
    NSMutableArray *resStr = [NSMutableArray array];
    NSDictionary *numbers = @{
        @"1": @[@"2", @"4"],
        @"2": @[@"1", @"5", @"3"],
        @"3": @[@"2", @"6"],
        @"4": @[@"1", @"5", @"7"],
        @"5": @[@"2", @"4", @"6", @"8"],
        @"6": @[@"3", @"5", @"9"],
        @"7": @[@"4", @"8"],
        @"8": @[@"5", @"7", @"9", @"0"],
        @"9": @[@"6", @"8"],
        @"0": @[@"8"],
    };

    for (int i = 0; i < number.length; i++) {
        if ([number integerValue] < 0) {
            return nil;
        } else {
        NSRange rng = NSMakeRange(i, 1);
        NSString *key = [number substringWithRange:rng];
        NSArray *tmp = [numbers valueForKey:key];
        for (NSString *nmb in tmp) {
            NSString *toAdd = [number stringByReplacingCharactersInRange:rng withString:nmb];
            [resStr addObject:toAdd];
        }
    }
    }
    return resStr;
}
@end
