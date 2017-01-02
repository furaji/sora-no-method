#import <Foundation/Foundation.h>

@interface 天体 : NSObject
- (void)メソッド;
@end

@implementation 天体
- (void)メソッド {
    NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
    [[NSFileHandle fileHandleWithStandardOutput] writeData: [@"天体のメソッド\n" dataUsingEncoding: NSUTF8StringEncoding]];
    [pool release];
}
@end

int main(void) {
    id _天体 = [[天体 alloc] init];
    [_天体 メソッド];

    return 0;
}
