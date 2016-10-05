#import <Cocoa/Cocoa.h>
#import <Foundation/Foundation.h>

@protocol ApmMenuProtocol <NSObject>
-(void)settings;
@end

@interface ApmStatusItem : NSObject
@property (nonatomic, weak) id<ApmMenuProtocol> delegate;
@property (nonatomic, strong) NSStatusItem *item;
@end
