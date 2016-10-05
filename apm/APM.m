#import "APM.h"

// constants
static NSTimeInterval const TIME_INTERVAL = 0.2;

@interface APM()
// stores the different actions in the array
@property (nonatomic, strong) NSMutableArray *actionsPerMinute;
// not sure if we'll need this
@property (nonatomic, assign) NSUInteger actionsInSecond;
// my event loop
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation APM

#pragma mark - APM Lifecycle

-(instancetype)init {
    self = [super init];
    
    if (self) {
        _currentApm = 0;
        _actionsInSecond = 0;
        [self initialize];
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
    _timer = [NSTimer scheduledTimerWithTimeInterval:TIME_INTERVAL target:self selector:@selector(calculateApm) userInfo:nil repeats:YES];
}

#pragma mark - APM Events

-(void)triggerEvent:(NSEvent *)event {
    _actionsInSecond += 1;
}

#pragma mark - APM Calculation

-(void)calculateApm {
    // record the number of actions over the last second
    [_actionsPerMinute insertObject:[self calculateAps] atIndex:0];
    
    // remove the last item in the array
    [_actionsPerMinute removeObjectAtIndex:[_actionsPerMinute count] - 1];
    
    [self setCurrentApm:[self reduceApm]];
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

-(void)registerAsObserverForObject:(id)obj forKeyPath:(NSString *)keyPath {
    [self addObserver:obj
                  forKeyPath:keyPath
                     options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld)
                     context:nil];
}

-(void)unregisterAsObserverForObject:(id)obj forKeyPath:(NSString *)keyPath {
    [obj removeObserver:self
                 forKeyPath:keyPath
                    context:nil];
}

@end
