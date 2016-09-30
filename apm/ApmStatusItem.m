#import "ApmStatusItem.h"

@interface ApmStatusItem()
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation ApmStatusItem

-(instancetype)init {
    self = [super init];
    
    if (self) {
        _item = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
        [self configureItem];
    }
    
    return self;
}

-(void)configureItem {
    [self configureItemProperties];
    [self configureItemMenu];
}

-(void)configureItemProperties {
    _item.title = @"0";
}

-(void)configureItemMenu {
    NSMenu *menu = [[NSMenu alloc] init];
    
    NSMenuItem *mitemExit =[[NSMenuItem alloc] initWithTitle:@"Exit" action:@selector(terminate:) keyEquivalent:@"q"];
    [menu addItem:mitemExit];
    
    _item.menu = menu;
}

#pragma mark - Apm Protocol

-(void)apmHasUpdated:(NSString *)updatedApm {
    _item.title = updatedApm;
}

@end
