//
//  UTModalViewController.m
//  uteach
//
//  Created by Santiago Lazzari on 3/13/17.
//  Copyright © 2017 Santiago Lazzari. All rights reserved.
//

#import "UTModalViewController.h"

#import "FXBlurView.h"

const CGFloat kModalViewControllerPresentationTransitioning = 0.2;
const CGFloat kModalViewControllerBlurRadius = 40;


@interface UTModalViewController ()

@property (strong, nonatomic) IBOutlet FXBlurView *blurView;

@property (weak, nonatomic) IBOutlet UIView *innerView;
@property (weak, nonatomic) UIViewController *innerViewController;
@property (weak, nonatomic) UIViewController *topViewController;

@property (nonatomic) CGFloat innerViewWidth;
@property (nonatomic) CGFloat innerViewHeight;

@end

@implementation UTModalViewController

#pragma mark - Init

+ (instancetype)showViewController:(UIViewController *)innerViewController onTopOfController:(UIViewController *)topViewController {
    UTModalViewController *modalViewController = [[UTModalViewController alloc] init];
    
    modalViewController.innerViewController = innerViewController;
    modalViewController.topViewController = topViewController;
    
    [modalViewController addChildViewController:innerViewController];
    [modalViewController.innerView addSubview:innerViewController.view];
    
    modalViewController.modalPresentationStyle = UIModalPresentationCurrentContext;
    [topViewController addChildViewController:modalViewController];
    [topViewController.view addSubview:modalViewController.view];
    
    [self presentModalViewController:modalViewController];
    
    return modalViewController;
}

+ (void)presentModalViewController:(UTModalViewController *)modalViewController {
    [modalViewController presentModal:self];
}

#pragma mark - Navigation

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupInnerView];
    [self setupBlurView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.innerViewController.view.frame = CGRectMake(0, 0, CGRectGetWidth(self.innerView.frame), CGRectGetHeight(self.innerView.frame));
}

#pragma mark - Setup

- (void)setupInnerView {
    self.innerView.layer.masksToBounds = YES;
    self.innerView.layer.cornerRadius = 5;
    [self.innerView addSubview:self.innerViewController.view];
}

- (void)setupBlurView {
    UITapGestureRecognizer *closeGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeModal:)];
    [self.blurView addGestureRecognizer:closeGestureRecognizer];
}

#pragma mark - Setters

- (void)setInnerViewWidth:(CGFloat)innerViewWidth height:(CGFloat)innerViewHeight {
    _innerViewWidth = innerViewWidth;
    _innerViewHeight = innerViewHeight;
}

#pragma mark - Actions

- (void)presentModal:(id)sender {
    self.innerView.alpha = 0;
    self.blurView.blurRadius = 0;
    [UIView animateWithDuration:kModalViewControllerPresentationTransitioning animations:^{
        self.blurView.blurRadius = kModalViewControllerBlurRadius;
        self.innerView.alpha = 1;
    }];
}

- (void)closeModal:(id)sender {
    [UIView animateWithDuration:kModalViewControllerPresentationTransitioning animations:^{
        self.blurView.blurRadius = 0;
        self.innerView.alpha = 0;
    } completion:^(BOOL finished) {
        [self.innerViewController.view removeFromSuperview];
        [self.innerViewController removeFromParentViewController];
        [self.view removeFromSuperview];
        [self removeFromParentViewController];
    
    }];
}



@end
