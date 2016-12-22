//
//  SERequestManager.h
//  secla
//
//  Created by Santiago Lazzari on 11/10/16.
//  Copyright © 2016 Santiago Lazzari. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SERequestConfigs.h"

@interface SERequestManager : NSObject

@property (strong, nonatomic)NSURLSession *session;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithConfigs:(SERequestConfigs *)configs;

- (void)getLocalObjectsWithRemoteObject:(Class)remoteObjectClass fromPath:(NSString *)path success:(void(^)(NSArray *))success failure:(void(^)(NSError *error))failure;

- (void)getRemoteObjects:(Class)remoteObjectClass fromPath:(NSString *)path success:(void(^)(NSArray *))success failure:(void(^)(NSError *error))failure;

@end
