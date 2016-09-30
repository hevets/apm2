#import "ApmStatusItem.h"
#import "AppDelegate.h"
#import <Foundation/Foundation.h>
#import "APMProtocolDelegate.h"

@interface APM : NSObject

@property (nonatomic, weak) id<APMProtocolDelegate> delegate;

-(instancetype)init NS_UNAVAILABLE;
-(instancetype)initWithDelegate:(id<APMProtocolDelegate>)delegate;
@end
