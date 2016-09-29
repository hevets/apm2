//
//  AppDelegate.m
//  apm
//
//  Created by Steve Henderson on 2016-09-29.
//  Copyright © 2016 Steve Henderson. All rights reserved.
//

#import "AppDelegate.h"
#import "APM.h"
#import "ApmStatusItem.h"

@interface AppDelegate ()
@property (nonatomic, strong) ApmStatusItem *statusItem;
@property (nonatomic, strong) APM *apm;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    _apm = [[APM alloc] init];
    _statusItem = [[ApmStatusItem alloc] init];
    _statusItem.delegate = _apm;
}



@end
