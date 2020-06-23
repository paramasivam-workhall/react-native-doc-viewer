#import "QLCustomPreviewController.h"
#import <UIKit/UIKit.h>

@implementation QLCustomPreviewController

/*
#pragma mark - Navigation
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (void)viewDidLoad {
    [super viewDidLoad];
    
//     When coming back from background we make sure the share button on the rightbBarButtonItem is disabled
    __weak typeof(self) weakSelf = self;
    [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidBecomeActiveNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
//        weakSelf.navigationItem.rightBarButtonItem = nil;
        weakSelf.navigationItem.rightBarButtonItem= [[UIBarButtonItem alloc] init] ;
    }];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

// hide on intial render
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if(self.childViewControllers.firstObject){
         UINavigationController* add = self.childViewControllers.firstObject;
        [self inspectSubviewsForView:add.view];
    }

}

// hide on intial render
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if(self.childViewControllers.firstObject){
            UINavigationController* add = self.childViewControllers.firstObject;
           [self inspectSubviewsForView:add.view];
    }
}



- (void)inspectSubviewsForView:(UIView *)view
{
    for (UIView *subview in view.subviews)
    {
        if ([subview isKindOfClass:[UINavigationBar class]])
        {
            UINavigationBar *bar = (UINavigationBar *)subview;
            if ([[bar items] count] > 0)
            {
                UINavigationItem *navItem = [[bar items] objectAtIndex:0];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [navItem setRightBarButtonItem:nil];
                });
            }
        }

        if ([subview isKindOfClass:[UIView class]] && [[subview subviews] count] > 0)
        {
            [self inspectSubviewsForView:subview];
        }
    }
}


// hide on tap
- (void)viewDidLayoutSubviews {
    NSLog(@"jmsjmg:viewDidLayoutSubviews %@",self);
    [self inspectSubviewsForView:self.childViewControllers.firstObject.view];
}

// hide on tap
- (void)viewWillLayoutSubviews {
    NSLog(@"jmsjmg:viewWillLayoutSubviews %@",self);
    [self inspectSubviewsForView:self.childViewControllers.firstObject.view];
}

@end
