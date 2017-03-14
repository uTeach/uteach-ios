//
//  UTHomeViewController.m
//  uteach
//
//  Created by Santiago Lazzari on 1/26/17.
//  Copyright © 2017 Santiago Lazzari. All rights reserved.
//

#import "UTHomeViewController.h"

#import "AppDelegate.h"
#import "UTModalNotificationViewController.h"
#import "UTLoginViewController.h"

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
    [UTModalNotificationViewController showViewController:[[UTLoginViewController alloc] init] onTopOfController:self withNotificationPreviewView:[[UIView alloc] init]];
//    [kNavigationFlowManager presentLoginViewControllerAnimated:YES];
}


@end
