//
//  UTHomeViewController.m
//  uteach
//
//  Created by Santiago Lazzari on 1/26/17.
//  Copyright © 2017 Santiago Lazzari. All rights reserved.
//

#import "UTHomeViewController.h"

#import "AppDelegate.h"

@interface UTHomeViewController ()

@end

@implementation UTHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)presentLoginButtonWasTapped:(id)sender {
    [kNavigationFlowManager presentLoginViewControllerAnimated:YES];
}


@end
