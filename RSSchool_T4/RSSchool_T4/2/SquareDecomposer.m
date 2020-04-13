#import "SquareDecomposer.h"

@implementation SquareDecomposer
- (NSArray <NSNumber*>*)decomposeNumber:(NSNumber*)number {
       
    if ([number integerValue] < 4) {
        return nil;
    }
    NSInteger rem = 0;
    NSMutableArray *array = [NSMutableArray arrayWithObject:number];
    
    while (array.count != 0) {
        NSInteger nmb = [[array lastObject] integerValue];
        [array removeLastObject];
        rem = rem + nmb*nmb;
           for (NSInteger i = nmb - 1; i > 0; i--) {
               if (rem - i*i >= 0) {
                   rem = rem - i*i;
                   [array addObject:[NSNumber numberWithInteger:i]];
                   if (rem == 0) {
                       NSArray *result = [array copy];
                       return [result sortedArrayUsingSelector: @selector(compare:)];;
                   }
               }
           }
           
       }
       
       return nil;
}
@end
