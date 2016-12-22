//
//  AppDelegate.h
//  uteach
//
//  Created by Santiago Lazzari on 12/22/16.
//  Copyright © 2016 Santiago Lazzari. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

