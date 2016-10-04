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
    [self registerListeners];
}

-(void)applicationWillTerminate:(NSNotification *)notification {
    [self removeListeners];
}

-(void)checkAccessibility {
    NSDictionary *options = @{(id)CFBridgingRelease(kAXTrustedCheckOptionPrompt) : @YES};
    _accessibilityEnabled = AXIsProcessTrustedWithOptions((CFDictionaryRef)options);
}

-(void)startApp {
    _statusItem = [[ApmStatusItem alloc] init];
    _apm = [[APM alloc] init];
}

-(void)registerListeners {
    [_apm registerAsObserverForObject:_statusItem forKeyPath:@"currentApm"];
}

-(void)removeListeners {
    [_apm unregisterAsObserverForObject:_statusItem forKeyPath:@"currentApm"];
}

@end
