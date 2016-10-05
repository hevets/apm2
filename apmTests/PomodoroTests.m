//
//  PomodoroTests.m
//  apm
//
//  Created by Steve Henderson on 2016-10-04.
//  Copyright © 2016 Steve Henderson. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Pomodoro.h"


@interface PomodoroTests : XCTestCase
@property (nonatomic, strong) Pomodoro *pomodoro;
@end

@implementation PomodoroTests

- (void)setUp {
    [super setUp];
    _pomodoro = [[Pomodoro alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testTimeLeftIsSetCorrectly {
    int time = 30;
    [_pomodoro setTimeLimit:time];
    XCTAssertEqual(_pomodoro.timeLimit, time);
}

@end
