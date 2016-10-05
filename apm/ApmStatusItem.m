#import "ApmStatusItem.h"
#import "APM.h"

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

#pragma mark - kvo stuff

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([object isKindOfClass:[APM class]]) {
        __weak APM *apm = ((APM *)object);
        [self updateTitle:[NSString stringWithFormat:@"%lu", (unsigned long)apm.currentApm]];
    }
}

-(void)updateTitle:(NSString *)title {
    _item.title = title;
}

@end
