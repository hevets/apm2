#import "APM.h"
#import "AppDelegate.h"
#import "ApmStatusItem.h"
#import "SettingsWindowController.h"

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

-(void)checkAccessibility {
    NSDictionary *options = @{ (id)CFBridgingRelease(kAXTrustedCheckOptionPrompt) : @YES };
    _accessibilityEnabled = AXIsProcessTrustedWithOptions((CFDictionaryRef)options);
}

-(void)startApp {
    _statusItem = [[ApmStatusItem alloc] init];
    _statusItem.delegate = self;
    
    _apm = [[APM alloc] init];
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

-(void)settings {
//    SettingsWindowController *wc = [[NSStoryboard storyboardWithName:@"Main" bundle:nil] instantiateControllerWithIdentifier:@"SettingsWindowController"];
//    self
    
     NSWindowController *wc = [[SettingsWindowController alloc] initWithWindowNibName:@"SettingsWindowController"];
    
}

@end
