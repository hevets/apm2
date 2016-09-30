#import "AppDelegate.h"
#import "APM.h"
#import "ApmStatusItem.h"

@interface AppDelegate ()
@property (nonatomic, strong) ApmStatusItem *statusItem;
@property (nonatomic, strong) APM *apm;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    [self checkAccessibility];
    [self startApp];
}

-(void)checkAccessibility {
    NSDictionary *options = @{(id)CFBridgingRelease(kAXTrustedCheckOptionPrompt) : @YES};
    _accessibilityEnabled = AXIsProcessTrustedWithOptions((CFDictionaryRef)options);
}

-(void)startApp {
    _statusItem = [[ApmStatusItem alloc] init];
    _apm = [[APM alloc] initWithDelegate:_statusItem];
}


@end
