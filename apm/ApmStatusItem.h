//
//  ApmStatusItem.h
//  apm
//
//  Created by Steve Henderson on 2016-09-29.
//  Copyright © 2016 Steve Henderson. All rights reserved.
//


#import <Cocoa/Cocoa.h>
#import <Foundation/Foundation.h>

@protocol StatusItemProtocol <NSObject>
-(NSString *)statusUpdate;
@end

@interface ApmStatusItem : NSObject
@property (nonatomic, weak) id<StatusItemProtocol> delegate;
@property (nonatomic, strong) NSStatusItem *item;
@end
