#import <Cocoa/Cocoa.h>
#import <Foundation/Foundation.h>
#import "APMProtocolDelegate.h"

@interface ApmStatusItem : NSObject<APMProtocolDelegate>

@property (nonatomic, strong) NSStatusItem *item;
-(void)apmHasUpdated:(NSString *)updatedApm;

@end
