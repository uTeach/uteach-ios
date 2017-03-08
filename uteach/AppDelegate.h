//
//  AppDelegate.h
//  uteach
//
//  Created by Santiago Lazzari on 12/22/16.
//  Copyright © 2016 Santiago Lazzari. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

#import "UTNavigationFlowManager.h"
#import "UTRequestManager.h"

#define kAppDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)
#define kNavigationFlowManager kAppDelegate.navigationFlowManager
#define kRequestManager kAppDelegate.requestManager

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

@property (strong, nonatomic) UTNavigationFlowManager *navigationFlowManager;

@property (strong, nonatomic) UTRequestManager *requestManager;

- (void)saveContext;

@end

