//
//  SENavigationFlowManager.m
//  secla
//
//  Created by Santiago Lazzari on 11/8/16.
//  Copyright © 2016 Santiago Lazzari. All rights reserved.
//

#import "UTNavigationFlowManager.h"

#import "UTSplashViewController.h"

@implementation UTNavigationFlowManager

#pragma mark - Init
+ (instancetype)sharedInstance {
    static UTNavigationFlowManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[UTNavigationFlowManager alloc] init];
        [sharedInstance setup];
    });
    return sharedInstance;
}

#pragma mark - Setup
- (void)setup {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
}

#pragma mark - Presentation

- (void)presentSplashViewControllerAnimated:(BOOL)animated {
    UTSplashViewController *splashViewController = [[UTSplashViewController alloc] init];
    
    [self presentViewController:splashViewController animated:animated completion:nil];
}

- (void)presentViewController:(UIViewController *)viewController animated:(BOOL)animated completion:(void (^)(void))completion {
    UIViewController *topViewController = [self topMostViewController];
    
    if (topViewController == nil) {
        self.window.rootViewController = viewController;
    } else {
        [topViewController presentViewController:viewController animated:animated completion:completion];
    }
}

- (UIViewController *)topMostViewController {
    UIViewController *topViewController = [self.window rootViewController];
    
    while ([topViewController presentedViewController] != nil) {
        topViewController = [topViewController presentedViewController];
    }
    
    return topViewController;
}

@end
