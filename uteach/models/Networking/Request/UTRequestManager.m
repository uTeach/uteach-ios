//
//  SERequestManager.m
//  secla
//
//  Created by Santiago Lazzari on 11/10/16.
//  Copyright © 2016 Santiago Lazzari. All rights reserved.
//

#import "UTRequestManager.h"

#import "UTRemoteObject.h"
#import "UTGetJsonRequest.h"
#import "UTPostJsonRequest.h"

static NSString *kSuccessJsonKey = @"exito";
static NSString *kResponseJsonKey = @"res";

@interface UTRequestManager ()

@property (strong, nonatomic)UTRequestConfigs *configs;

@end


@implementation UTRequestManager

#pragma mark - Init
- (instancetype)initWithConfigs:(UTRequestConfigs *)configs {
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
        for (UTRemoteObject *remoteObject in remoteObjects) {
            remoteObject.host = self.configs.baseUrl;
            [localObjects addObject:[remoteObject localObject]];
        }
        
        success(localObjects);
    } failure:failure];
}

- (void)getRemoteObjects:(Class)remoteObjectClass fromPath:(NSString *)path success:(void(^)(NSArray *))success failure:(void(^)(NSError *error))failure {
    
    UTGetJsonRequest *jsonRequest = [[UTGetJsonRequest alloc] initWithSession:self.session];
    
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

- (UTRemoteObject *)remoteObject:(Class)remoteObjectClass withJson:(NSDictionary *)json {
    UTRemoteObject *remoteObject = [[remoteObjectClass alloc] init];
    
    for (NSString *propertyName in [json allKeys]) {
        if ([remoteObject respondsToSelector:NSSelectorFromString(propertyName)]) {
            [remoteObject setValue:[json valueForKey:propertyName] forKey:propertyName];
        
        }
    }
    
    return remoteObject;
}

- (void)getFacebookAccessToken {
    UTPostJsonRequest *postRequest = [[UTPostJsonRequest alloc] initWithSession:self.session];
    
    NSDictionary *jsonBody = @{
                               @"grant_type" : @"assertion",
                               @"assertion" : @"EAACEdEose0cBANmcOrao0VN00UT4hdwOUHlSnkijc4bF2dbr46QfVs1hut6ZBjTemT3yhrmoXtVDBjm8Pmxig5IAoZBve7JdMl4HxNHHua1okVQNhSrKAxev6e9WRmI6brixEIkeHPYcKmtQZAjHjRtleMOXP6aV2hspWwT1CoGeJhpQGQ9AT05FTCxMbkZD"
                               };
    
    [postRequest postJsonFromURL:[self completeUrlWithPath:@"oauth/token"] json:jsonBody success:^(NSData *data) {
        NSError *error;
        NSJSONSerialization *jsonSerialization = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        
        NSLog(@"%@", jsonSerialization);
        
    } failure:^(NSError *error) {
        
    }];
}

@end
