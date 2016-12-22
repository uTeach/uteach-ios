//
//  SERequestManager.m
//  secla
//
//  Created by Santiago Lazzari on 11/10/16.
//  Copyright © 2016 Santiago Lazzari. All rights reserved.
//

#import "SERequestManager.h"

#import "SERemoteObject.h"
#import "SEGetJsonRequest.h"
#import "SEPostRequest.h"

static NSString *kSuccessJsonKey = @"exito";
static NSString *kResponseJsonKey = @"res";

@interface SERequestManager ()

@property (strong, nonatomic)SERequestConfigs *configs;

@end


@implementation SERequestManager

#pragma mark - Init
- (instancetype)initWithConfigs:(SERequestConfigs *)configs {
    if (self = [super init]) {
        self.configs = configs;
        [self setup];
    }

    return self;
}

#pragma mark - Setup
- (void)setup {
    [self setupSession];
}

- (void)setupSession {
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    self.session = session;
}

#pragma mark - Requests
- (void)getLocalObjectsWithRemoteObject:(Class)remoteObjectClass fromPath:(NSString *)path success:(void(^)(NSArray *))success failure:(void(^)(NSError *error))failure {
    NSMutableArray *localObjects = [[NSMutableArray alloc] init];
    [self getRemoteObjects:remoteObjectClass fromPath:path success:^(NSArray *remoteObjects) {
        for (SERemoteObject *remoteObject in remoteObjects) {
            remoteObject.host = self.configs.baseUrl;
            [localObjects addObject:[remoteObject localObject]];
        }
        
        success(localObjects);
    } failure:failure];
}

- (void)getRemoteObjects:(Class)remoteObjectClass fromPath:(NSString *)path success:(void(^)(NSArray *))success failure:(void(^)(NSError *error))failure {
    
    SEGetJsonRequest *jsonRequest = [[SEGetJsonRequest alloc] initWithSession:self.session];
    
    [jsonRequest getJsonFromURL:[self completeUrlWithPath:path] success:^(NSJSONSerialization *json) {
        // Process json
        
        BOOL ok = [[json valueForKey:kSuccessJsonKey] boolValue];
        
        if (!ok) {
            dispatch_async(dispatch_get_main_queue(),^ {
                failure([[NSError alloc] init]);
            });
            return;
        }
        
        NSJSONSerialization *jsonResponse = [json valueForKey:kResponseJsonKey];
        
        NSArray *remoteObjects = [self remoteObjects:remoteObjectClass withJson:(NSArray *)jsonResponse];
        
        dispatch_async(dispatch_get_main_queue(),^ {
            success(remoteObjects);
        });
        
    } failure:^(NSError *error) {
        dispatch_async(dispatch_get_main_queue(),^ {
            failure(error);
        });
        
    }];
}

- (NSString *)completeUrlWithPath:(NSString *)path {
    NSString *completePath = [NSString stringWithFormat:@"%@/%@", self.configs.baseUrl, path];
    NSLog(@"get to path : %@", completePath);
    return completePath;
}

#pragma mark - Parse
- (NSArray *)remoteObjects:(Class)remoteObjectClass withJson:(NSArray *)json {
    NSMutableArray *remoteObjects = [[NSMutableArray alloc] init];
    
    for (NSDictionary *remoteJsonObject in json) {
        NSString *key = [[remoteJsonObject allKeys] objectAtIndex:0];
        
        [remoteObjects addObject:[self remoteObject:remoteObjectClass withJson:[remoteJsonObject objectForKey:key]]];
    }
    
    return remoteObjects;
}

- (SERemoteObject *)remoteObject:(Class)remoteObjectClass withJson:(NSDictionary *)json {
    SERemoteObject *remoteObject = [[remoteObjectClass alloc] init];
    
    for (NSString *propertyName in [json allKeys]) {
        if ([remoteObject respondsToSelector:NSSelectorFromString(propertyName)]) {
            [remoteObject setValue:[json valueForKey:propertyName] forKey:propertyName];
        
        }
    }
    
    return remoteObject;
}

@end
