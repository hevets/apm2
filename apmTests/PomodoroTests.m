#import <XCTest/XCTest.h>
#import "Pomodoro.h"
#import "Constants.h"


@interface PomodoroTests : XCTestCase

@property (nonatomic, strong) Pomodoro *pomodoro;

@end

@implementation PomodoroTests

- (void)setUp {
    [super setUp];
    _pomodoro = [[Pomodoro alloc] init];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testTaskLimitDefaults {
    XCTAssertEqual(_pomodoro.taskLimit, TASK_LIMIT);
}

- (void)testBreakLimitDefaults {
    XCTAssertEqual(_pomodoro.breakLimit, BREAK_LIMIT);
}

- (void)testTaskLimitSetter {
    XCTAssertEqual(_pomodoro.taskLimit, TASK_LIMIT);
    int newTaskLimit = 50;
    [_pomodoro setTaskLimit:newTaskLimit];
    XCTAssertEqual(_pomodoro.taskLimit, newTaskLimit);
}

- (void)testBreakLimitSetter {
    XCTAssertEqual(_pomodoro.breakLimit, BREAK_LIMIT);
    int newBreakLimit = 10;
    [_pomodoro setBreakLimit:newBreakLimit];
    XCTAssertEqual(_pomodoro.breakLimit, newBreakLimit);
}

@end
