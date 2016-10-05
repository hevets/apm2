//
//  Pomodoro.m
//  apm
//
//  Created by Steve Henderson on 2016-10-04.
//  Copyright © 2016 Steve Henderson. All rights reserved.
//

#import "Pomodoro.h"
#import "Constants.h"

@implementation Pomodoro

-(instancetype)init {
    self = [super init];
    
    if (self) {
        _taskLimit = TASK_LIMIT;
        _breakLimit = BREAK_LIMIT;
    }
    
    return self;
}

@end
