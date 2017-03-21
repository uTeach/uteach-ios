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
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor redColor];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:[[UTLoginViewController alloc] init]];
    
    [navigationController pushViewController:[[UIViewController alloc] init] animated:NO];
    UTModalNotificationViewController *modalNotificationController = [UTModalNotificationViewController showViewController:navigationController onTopOfController:self withNotificationPreviewView:view];
    
    [NSTimer scheduledTimerWithTimeInterval:3 repeats:NO block:^(NSTimer * _Nonnull timer) {
        [modalNotificationController dismissModalNotificationViewController];
    }];
    
//    [kNavigationFlowManager presentLoginViewControllerAnimated:YES];
}


@end
