//
//  SENavigationFlowManager.m
//  secla
//
//  Created by Santiago Lazzari on 11/8/16.
//  Copyright © 2016 Santiago Lazzari. All rights reserved.
//

#import "UTNavigationFlowManager.h"

#import "UTSplashViewController.h"
#import "UTHomeViewController.h"
#import "UTLoginViewController.h"

@interface UTNavigationFlowManager () <UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate>

@end

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

- (void)presentHomeViewControllerAnimated:(BOOL)animated {
    UTHomeViewController *homeViewController = [[UTHomeViewController alloc] init];
    
    [self presentViewController:homeViewController animated:animated completion:nil];
}

- (void)presentLoginViewControllerAnimated:(BOOL)animated {
    UTLoginViewController *loginViewController = [[UTLoginViewController alloc] init];
    
    loginViewController.transitioningDelegate = self;
    
    [self presentViewController:loginViewController animated:animated completion:nil];
    
}

- (void)presentRegisterViewControllerAnimated:(BOOL)animated {
    NSLog(@"Might be implemeted present register like a popup");    
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

#pragma mark - UIViewControllerAnimatedTransitioning

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 3;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    UIView *presentingView = presenting.view;
    UIView *presentedView = presented.view;
    
    presenting.view = nil;
    presented.view = nil;
    
    CGFloat presentedViewX = 10;
    CGFloat presentedViewY = 10;
    CGFloat presentedViewWidth = presentingView.frame.size.width - 20;
    CGFloat presentedViewHeight = presentingView.frame.size.height - 20;
    presentedView.frame = CGRectMake(presentedViewX, presentedViewY, presentedViewWidth, presentedViewHeight);
    
    [presentingView addSubview:presentedView];
    
    [presentingView bringSubviewToFront:presentedView];
    presented.view = presentingView;
    
    return self;
}

@end
