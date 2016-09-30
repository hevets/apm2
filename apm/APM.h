//
//  APM.h
//  apm
//
//  Created by Steve Henderson on 2016-09-29.
//  Copyright © 2016 Steve Henderson. All rights reserved.
//

#import "ApmStatusItem.h"
#import <Foundation/Foundation.h>
#import "APMProtocolDelegate.h"

@interface APM : NSObject
@property (nonatomic, weak) id<APMProtocolDelegate> delegate;
@end
