#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate, ApmMenuProtocol>

@property (nonatomic, assign) BOOL accessibilityEnabled;

@end

