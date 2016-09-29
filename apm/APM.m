//
//  APM.m
//  apm
//
//  Created by Steve Henderson on 2016-09-29.
//  Copyright © 2016 Steve Henderson. All rights reserved.
//

#import "APM.h"

@interface APM()
@property (nonatomic, assign) NSUInteger currentApm;
@end

@implementation APM

-(instancetype)init {
    self = [super init];
    
    if (self) {
        _currentApm = 0;
    }
    
    return self;
}

-(NSString *)statusUpdate {
    return [NSString stringWithFormat:@"%lu", (unsigned long)_currentApm];
}

@end
