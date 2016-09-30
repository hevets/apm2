#import "APM.h"

@interface APM()

// stores the different actions in the array
@property (nonatomic, strong) NSMutableArray *actionsPerMinute;

// not sure if we'll need this
@property (nonatomic, assign) NSUInteger actionsInSecond;
@property (nonatomic, assign) NSUInteger currentApm;

// my event loop
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation APM

#pragma mark - APM Lifecycle

-(instancetype)initWithDelegate:(id<APMProtocolDelegate>)delegate {
    self = [super init];
    
    if (self) {
        _currentApm = 0;
        _actionsInSecond = 0;
        _delegate = delegate;
        [self initialize];
        [self bindApmEvents];
        [self startTimer];
    }
    
    return self;
}

-(void)dealloc {
    [_timer invalidate];
}

#pragma mark - APM Properties

-(void)initialize {
    _actionsPerMinute = [NSMutableArray array];
    for (int i = 0; i < 60; i++) {
        [_actionsPerMinute addObject:[NSNumber numberWithInt:0]];
    }
}

-(void)startTimer {
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(calculateApm) userInfo:nil repeats:YES];
}

#pragma mark - APM Events

-(void)bindApmEvents {
    
    AppDelegate *appDelegate = (AppDelegate *)[NSApp delegate];
    
    if (appDelegate.accessibilityEnabled) {
        [NSEvent addGlobalMonitorForEventsMatchingMask:(NSLeftMouseDownMask | NSRightMouseDownMask | NSOtherMouseDownMask | NSKeyDownMask) handler:^(NSEvent *event) {
            [self apmEvent:event];
        }];
    }
}

-(void)apmEvent:(NSEvent *)event {
    _actionsInSecond += 1;
}

#pragma mark - APM Calculation

-(void)calculateApm {
    // record the number of actions over the last second
    [_actionsPerMinute insertObject:[self calculateAps] atIndex:0];
    
    // remove the last item in the array
    [_actionsPerMinute removeObjectAtIndex:[_actionsPerMinute count] - 1];
    
    _currentApm = [self reduceApm];
    
    // update the status after we've gotten our current apm
    [self statusUpdate];
}

-(NSUInteger)reduceApm {
    NSUInteger totalActions = 0;
    for (NSNumber *actionsInSecond in _actionsPerMinute) {
        totalActions += [actionsInSecond integerValue];
    }
    
    return totalActions;
}

-(NSNumber *)calculateAps {
    NSNumber *lastSecond = [NSNumber numberWithInteger:_actionsInSecond];
    _actionsInSecond = 0;
    return lastSecond;
}

-(void)statusUpdate {
    [self.delegate apmHasUpdated:[NSString stringWithFormat:@"%lu", (unsigned long)_currentApm]];
}

@end
