//
//  SENavigationFlowManager.h
//  secla
//
//  Created by Santiago Lazzari on 11/8/16.
//  Copyright © 2016 Santiago Lazzari. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface UTNavigationFlowManager : NSObject

@property (strong, nonatomic) UIWindow *window;

+ (instancetype)sharedInstance;

- (void)presentSplashViewControllerAnimated:(BOOL)animated;

@end
