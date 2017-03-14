//
//  UTModalViewController.h
//  uteach
//
//  Created by Santiago Lazzari on 3/13/17.
//  Copyright © 2017 Santiago Lazzari. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UTModalViewController : UIViewController

+ (instancetype)showViewController:(UIViewController *)innerViewController onTopOfController:(UIViewController *)topViewController;

- (void)setInnerViewWidth:(CGFloat)innerViewWidth height:(CGFloat)innerViewHeight;


@end
