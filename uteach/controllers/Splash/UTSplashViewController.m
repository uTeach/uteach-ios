//
//  UTSplashViewController.m
//  uteach
//
//  Created by Santiago Lazzari on 12/25/16.
//  Copyright © 2016 Santiago Lazzari. All rights reserved.
//

#import "UTSplashViewController.h"

#import "UIColor+UTColorPalette.h"

@interface UTSplashViewController ()

@end

@implementation UTSplashViewController

#pragma mark - Navigation

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupView];
}

#pragma mark - Setup

- (void)setupView {
    self.view.backgroundColor = [UIColor utGreen];
}

@end
