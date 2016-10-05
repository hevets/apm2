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
    
    // create items
    NSMenuItem *itemSettings = [[NSMenuItem alloc] initWithTitle:@"Settings" action:@selector(settingAction:) keyEquivalent:@"s"];
    NSMenuItem *itemExit = [[NSMenuItem alloc] initWithTitle:@"Exit" action:@selector(terminate:) keyEquivalent:@"q"];
    
    // make sure that the target is set to self
    [itemSettings setTarget:self];
    
    // add items to menu
    [menu addItem:itemSettings];
    [menu addItem:itemExit];
    
    // bind the menu to the NSStatusItem
    _item.menu = menu;
}

#pragma mark - menu item actions

-(void)settingAction:(nullable id)sender {
    [self.delegate settings];
}

#pragma mark - kvo stuff

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([object isKindOfClass:[APM class]]) {
        __weak APM *apm = ((APM *)object);
        [self updateTitle:[NSString stringWithFormat:@"%lu", (unsigned long)apm.currentApm]];
    }
}

#pragma mark - update UI

-(void)updateTitle:(NSString *)title {
    _item.title = title;
}

@end
