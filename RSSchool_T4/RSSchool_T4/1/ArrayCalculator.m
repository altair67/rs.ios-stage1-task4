#import "ArrayCalculator.h"

@implementation ArrayCalculator
+ (NSInteger)maxProductOf:(NSInteger)numberOfItems itemsFromArray:(NSArray *)array {
    
    NSMutableArray *a2 = [array mutableCopy];
    NSInteger result = 1;
    NSInteger i = 0;
    
    while (i < a2.count) {
        if ([a2[i] isKindOfClass: [NSNumber class]]) {
            i++;
        } else {
            [a2 removeObject:a2[i]];
        }
    }
    
    if (a2.count == 0) {
        return 0;
    }
    
    [a2 sortUsingComparator:^(id a, id b) {
           if (abs([a intValue]) < abs([b intValue])) {
               return NSOrderedDescending;
           } else if (abs([b intValue]) < abs([a intValue])) {
               return NSOrderedAscending;
           } else {
               return NSOrderedSame;
           }
       }];
    if (numberOfItems > a2.count) {
        for (NSNumber *number in a2) {
            result *= [number integerValue];
        }
    } else {
        for (int i = 0; i < numberOfItems; i++) {
            result *= [a2[i] integerValue];
        }
        if (result < 0) {
            result = 1;
            [a2 sortUsingComparator:^(id a, id b) {
                if ([b integerValue] > [a integerValue]) {
                    return NSOrderedDescending;
                } else  if ([a integerValue] < [b integerValue]) {
                    return NSOrderedAscending;
                } else {
                    return NSOrderedSame;
                }
            }];
            for (int i = 0; i < numberOfItems; i++) {
                result *= [a2[i] integerValue];
            }
        }
    }
    
    return result;
}
@end
