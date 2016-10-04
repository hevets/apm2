#import "ApmStatusItem.h"
#import "AppDelegate.h"
#import <Foundation/Foundation.h>

@interface APM : NSObject

// expose as a KVO value
@property (nonatomic, assign) NSUInteger currentApm;

// initializers
-(instancetype)init;

// registers object to observe changes to keyPath
-(void)registerAsObserverForObject:(id)obj forKeyPath:(NSString *)keyPath;
-(void)unregisterAsObserverForObject:(id)obj forKeyPath:(NSString *)keyPath;

@end
