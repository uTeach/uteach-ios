//
//  UTSplashViewController.m
//  uteach
//
//  Created by Santiago Lazzari on 12/25/16.
//  Copyright © 2016 Santiago Lazzari. All rights reserved.
//

#import "UTSplashViewController.h"

#import "UIColor+UTColorPalette.h"
#import "FLAnimatedImage.h"
#import "AppDelegate.h"

@interface UTSplashViewController ()

@property (strong, nonatomic) FLAnimatedImage *animatingImage;
@property (weak, nonatomic) IBOutlet FLAnimatedImageView *animatingImageView;

@end

@implementation UTSplashViewController

#pragma mark - Navigation

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupView];
    [self login];
}

#pragma mark - Setup

- (void)setupView {
    self.view.backgroundColor = [UIColor utGreen];
    [self setupAnimatingImage];
}

- (void)setupAnimatingImage {
    NSString *filePath = [[NSBundle mainBundle] pathForResource: @"splash_animation" ofType: @"gif"];
    NSData *gifData = [NSData dataWithContentsOfFile: filePath];
    
    self.animatingImage = [[FLAnimatedImage alloc] initWithAnimatedGIFData:gifData];
    self.animatingImageView.animatedImage = self.animatingImage;
    [self.animatingImageView startAnimating];
}


#pragma mark - Login

- (void)login {
    [NSTimer scheduledTimerWithTimeInterval:0 repeats:NO block:^(NSTimer * _Nonnull timer) {
        [kNavigationFlowManager presentHomeViewControllerAnimated:YES];
    }];
}

@end
