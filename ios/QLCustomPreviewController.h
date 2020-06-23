//
//  QLCustomPreviewController.h
//  RNDocViewer
//
//  Created by Test on 22/06/20.
//  Copyright © 2020 Facebook. All rights reserved.
//


#import <QuickLook/QuickLook.h>

NS_ASSUME_NONNULL_BEGIN

@interface QLCustomPreviewController : QLPreviewController
- (void)viewDidLoad ;
- (void)dealloc;
- (void)viewWillAppear:(BOOL)animated;
- (void)viewDidAppear:(BOOL)animated;
//- (void)viewDidLayoutSubviews;
//- (void)viewWillLayoutSubviews;
//- (void)hideShareButton;
@end

NS_ASSUME_NONNULL_END

