//
//  UTModalNotificationViewController.h
//  uteach
//
//  Created by Santiago Lazzari on 3/13/17.
//  Copyright © 2017 Santiago Lazzari. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UTModalNotificationViewController : UIViewController

+ (instancetype)showViewController:(UIViewController *)innerViewController onTopOfController:(UIViewController *)topViewController withNotificationPreviewView:(UIView *)notificationPreviewView;
- (void)dismissModalNotificationViewController;

- (void)setInnerViewWidth:(CGFloat)innerViewWidth height:(CGFloat)innerViewHeight;


@end
