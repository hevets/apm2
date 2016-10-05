#import "APM.h"
#import "AppDelegate.h"
#import "ApmStatusItem.h"

@interface AppDelegate ()
@property (nonatomic, strong) ApmStatusItem *statusItem;
@property (nonatomic, strong) APM *apm;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // check to see if we have permissions to track events
    [self checkAccessibility];
    
    // this initialize
    [self startApp];
    
    // start tracking the keystrokes and mouse taps
    [self registerEventListener];
    
    // attach listeners to apm
    [self attachListeners];
}

-(void)applicationWillTerminate:(NSNotification *)notification {
    [self removeListeners];
}

-(void)startApp {
    _statusItem = [[ApmStatusItem alloc] init];
    _apm = [[APM alloc] init];
}

-(void)checkAccessibility {
    NSDictionary *options = @{ (id)CFBridgingRelease(kAXTrustedCheckOptionPrompt) : @YES };
    _accessibilityEnabled = AXIsProcessTrustedWithOptions((CFDictionaryRef)options);
}

-(void)registerEventListener {
    if (self.accessibilityEnabled) {
        [NSEvent addGlobalMonitorForEventsMatchingMask:(NSLeftMouseDownMask | NSRightMouseDownMask | NSOtherMouseDownMask | NSKeyDownMask) handler:^(NSEvent *event) {
            [_apm triggerEvent:event];
        }];
    }
}

-(void)attachListeners {
    [_apm registerAsObserverForObject:_statusItem forKeyPath:@"currentApm"];
}

-(void)removeListeners {
    [_apm unregisterAsObserverForObject:_statusItem forKeyPath:@"currentApm"];
}

@end
