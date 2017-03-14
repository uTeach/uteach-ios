//
//  UTModalNotificationViewController.m
//  uteach
//
//  Created by Santiago Lazzari on 3/13/17.
//  Copyright © 2017 Santiago Lazzari. All rights reserved.
//

#import "UTModalNotificationViewController.h"

#import "FXBlurView.h"

const CGFloat kModalNotifiactionViewControllerPresentationTransitioning = 0.5;
const CGFloat kModalNotifiactionViewControllerBlurRadius = 40;
//const CGFloat kModalNotifiactionViewControllerPresentationTransitioning = 0;


@interface UTModalNotificationViewController ()

@property (strong, nonatomic) IBOutlet FXBlurView *blurView;

@property (strong, nonatomic) UIView *notificationView;
@property (nonatomic) CGFloat notificationsViewY;

@property (nonatomic) CGFloat notificationViewTap;

@end

@implementation UTModalNotificationViewController

#pragma mark - Init

+ (instancetype)showViewController:(UIViewController *)innerViewController onTopOfController:(UIViewController *)topViewController withNotificationPreviewView:(UIView *)notificationPreviewView {
    UTModalNotificationViewController *modalNotificationViewController = [[UTModalNotificationViewController alloc] init];
   
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
    
    [self setupBlurView];
    [self setupNotificationView];
    [self setupView];
}

- (void)viewDidLayoutSubviews {
    [self layoutNotificationView];
}

- (void)layoutNotificationView {
    self.notificationView.frame = CGRectMake(5, self.notificationsViewY, CGRectGetWidth(self.view.frame) - 10, 70);
}

#pragma mark - Setup

- (void)setupNotificationView {
    self.notificationView = [[UIView alloc] init];
    [self.notificationView setBackgroundColor:[UIColor blackColor]];
    
    self.notificationView.layer.masksToBounds = YES;
    self.notificationView.layer.cornerRadius = 10;
    
    UILongPressGestureRecognizer *longPressSlideDownGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(notificationViewWasLongPressed:)];
    longPressSlideDownGestureRecognizer.minimumPressDuration = 0;
    
    [self.notificationView addGestureRecognizer:longPressSlideDownGestureRecognizer];
    [self.view addSubview:self.notificationView];
    [self.view bringSubviewToFront:self.notificationView];
}

- (void)setupBlurView {
    [self.blurView setHidden:YES];
}

- (void)setupView {
    
}

#pragma mark - Actions

- (void)notificationViewWasLongPressed:(UILongPressGestureRecognizer *)sender {
    
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
            self.notificationViewTap = [sender locationInView:self.view].y;
            break;
        case UIGestureRecognizerStateChanged:
            self.notificationsViewY = 30 + ([sender locationInView:self.view].y - self.notificationViewTap) / 2.0;
            [self layoutNotificationView];
            break;
        case UIGestureRecognizerStateEnded:
            if (self.notificationsViewY )
            NSLog(@"cancelled");
            break;
        default:
            break;
    }
    
}

- (void)presentModalNotification:(id)sender {
//    self.blurView.blurRadius = 0;
    self.notificationsViewY = - 100;
    [self layoutNotificationView];
    
    self.notificationsViewY = 30;
    
    [UIView animateWithDuration:kModalNotifiactionViewControllerPresentationTransitioning delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        [self layoutNotificationView];

    } completion:nil];
}

@end
