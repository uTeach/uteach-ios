//
//  UTModalNotificationViewController.m
//  uteach
//
//  Created by Santiago Lazzari on 3/13/17.
//  Copyright © 2017 Santiago Lazzari. All rights reserved.
//

#import "UTModalNotificationViewController.h"

#import "UTModalViewController.h"

#import "FXBlurView.h"

const CGFloat kModalNotifiactionViewControllerPresentationTransitioning = 0.3;
const CGFloat kModalNotifiactionViewControllerBlurRadius = 40;
const CGFloat kModalNotificationViewControllerNotificationYDefault = 30;


@interface UTModalNotificationViewController ()

@property (nonatomic) CGFloat notificationsViewY;
@property (nonatomic) CGFloat notificationViewTap;

@property (strong, nonatomic) UIViewController *topViewController;
@property (strong, nonatomic) UIViewController *innerViewController;
@property (nonatomic) BOOL isModal;
@property (strong, nonatomic) IBOutlet FXBlurView *blurView;
@property (strong, nonatomic) UIView *innerView;
@property (strong, nonatomic) UIView *notificationPreviewView;

@property (nonatomic) CGFloat innerViewWidth;
@property (nonatomic) CGFloat innerViewHeight;

@end

@implementation UTModalNotificationViewController

#pragma mark - Init

+ (instancetype)showViewController:(UIViewController *)innerViewController onTopOfController:(UIViewController *)topViewController withNotificationPreviewView:(UIView *)notificationPreviewView {
    UTModalNotificationViewController *modalNotificationViewController = [[UTModalNotificationViewController alloc] init];
    
    modalNotificationViewController.topViewController = topViewController;
    modalNotificationViewController.innerViewController = innerViewController;
    modalNotificationViewController.notificationPreviewView = notificationPreviewView;
    modalNotificationViewController.innerViewWidth = 250;
    modalNotificationViewController.innerViewHeight = 400;
    
    modalNotificationViewController.modalPresentationStyle = UIModalPresentationCurrentContext;
    [topViewController addChildViewController:modalNotificationViewController];
    [topViewController.view addSubview:modalNotificationViewController.view];
    
    
    [self presentModalViewController:modalNotificationViewController];
    
    return modalNotificationViewController;
}


+ (void)presentModalViewController:(UTModalNotificationViewController *)modalNotificationViewController {
    [modalNotificationViewController presentModalNotification:self];
}

#pragma mark - Navigation

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.isModal = NO;
    [self setupView];
    self.blurView.blurEnabled = NO;
}

- (void)viewDidLayoutSubviews {
    [self layoutNotificationView];
}

- (void)layoutNotificationView {
    if (self.isModal) {
        self.view.frame = self.topViewController.view.frame;
        self.innerViewController.view.frame = CGRectMake(0, 0, CGRectGetWidth(self.innerView.frame), CGRectGetHeight(self.innerView.frame));
    } else {
        self.view.frame = CGRectMake(5, self.notificationsViewY, CGRectGetWidth(self.topViewController.view.frame) - 10, 70);
        self.notificationPreviewView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        
    }
}

- (void)layoutInnerView {
    CGFloat innerViewX = (self.topViewController.view.frame.size.width - self.innerViewWidth) / 2.0;
    CGFloat innerViewY = (self.topViewController.view.frame.size.height - self.innerViewHeight) / 2.0;
    CGFloat innerViewWidth = self.innerViewWidth;
    CGFloat innerViewHeight = self.innerViewHeight;
    
    self.innerView.frame = CGRectMake(innerViewX, innerViewY, innerViewWidth, innerViewHeight);
}

#pragma mark - Setup

- (void)setupView {
    [self.view setBackgroundColor:[UIColor blackColor]];
    
    self.view.layer.masksToBounds = YES;
    self.view.layer.cornerRadius = 10;
    
    UILongPressGestureRecognizer *longPressSlideDownGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(notificationViewWasLongPressed:)];
    longPressSlideDownGestureRecognizer.minimumPressDuration = 0;
    
    [self.view addGestureRecognizer:longPressSlideDownGestureRecognizer];
    [self.view addSubview:self.notificationPreviewView];
    [self.view layoutIfNeeded];
}

#pragma mark - Setters

- (void)setInnerViewWidth:(CGFloat)innerViewWidth height:(CGFloat)innerViewHeight {
    _innerViewWidth = innerViewWidth;
    _innerViewHeight = innerViewHeight;
    
    [self layoutInnerView];
}

#pragma mark - Actions

- (void)notificationViewWasLongPressed:(UILongPressGestureRecognizer *)sender {
    switch (sender.state) {
        case UIGestureRecognizerStateBegan :
            self.notificationViewTap = [sender locationInView:self.view].y;
            break;
        case UIGestureRecognizerStateChanged:
            self.notificationsViewY = kModalNotificationViewControllerNotificationYDefault + ([sender locationInView:self.view].y - self.notificationViewTap) / 2.0;
            
            if (self.notificationsViewY >= 100 + kModalNotificationViewControllerNotificationYDefault) {
                self.isModal = YES;
                sender.enabled = NO;
                
                [self presentModalView];
            } else {
                [self layoutNotificationView];
            }

            break;
        case UIGestureRecognizerStateEnded:
            [self centerModalNotifiaction];
            
            break;
        default:
            break;
    }
}

- (void)presentModalView {
    [self.notificationPreviewView removeFromSuperview];
    self.view.layer.cornerRadius = 0;
    self.blurView.backgroundColor = [UIColor clearColor];
    self.blurView.blurEnabled = YES;
    self.blurView.blurRadius = 0;
    
    UIView *modalView = [[UIView alloc] initWithFrame:self.view.frame];
    modalView.backgroundColor = [UIColor blackColor];
    
    modalView.layer.masksToBounds = YES;
    modalView.layer.cornerRadius = 10;
    self.innerView = modalView;
    
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeModal:)]];
    [self.view addSubview:modalView];
    
    [self layoutNotificationView];
    
    [self addChildViewController:self.innerViewController];
    [self.innerView addSubview:self.innerViewController.view];
    
    self.modalPresentationStyle = UIModalPresentationCurrentContext;
    [self.topViewController addChildViewController:self];
    [self.topViewController.view addSubview:self.view];

    
    [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.blurView.blurRadius = kModalNotifiactionViewControllerBlurRadius;
        [self layoutInnerView];
    } completion:nil];
}

- (void)presentModalNotification:(id)sender {
    self.notificationsViewY = - 100;
    [self layoutNotificationView];
    
    [self centerModalNotifiaction];
}

- (void)centerModalNotifiaction {
    self.notificationsViewY = kModalNotificationViewControllerNotificationYDefault;
    
    [UIView animateWithDuration:kModalNotifiactionViewControllerPresentationTransitioning delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        [self layoutNotificationView];
        
    } completion:nil];
}


- (void)dismissModalNotificationViewController {
    if (!self.isModal) {
        [UIView animateWithDuration:kModalNotifiactionViewControllerPresentationTransitioning animations:^{
            self.view.frame = CGRectMake(self.view.frame.origin.x, -self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height);
        } completion:^(BOOL finished) {
            [self removeFromParentViewController];
        }];
    }
}

- (void)closeModal:(id)sender {
    [UIView animateWithDuration:kModalNotifiactionViewControllerPresentationTransitioning animations:^{
        self.blurView.alpha = 0;
        self.innerView.alpha = 0;
    } completion:^(BOOL finished) {
        [self.innerViewController.view removeFromSuperview];
        [self.innerViewController removeFromParentViewController];
        [self.view removeFromSuperview];
        [self removeFromParentViewController];
    }];
}

@end
