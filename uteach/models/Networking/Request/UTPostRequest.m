//
//  SEPostRequest.m
//  secla
//
//  Created by Santiago Lazzari on 12/15/16.
//  Copyright © 2016 Santiago Lazzari. All rights reserved.
//

#import "UTPostRequest.h"

@implementation UTPostRequest

- (void)postDataFromURL:(NSString *)url body:(NSString *)body success:(void(^)(NSData *data))success failure:(void(^)(NSError *error))failure {
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    NSData *postData = [body dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:postData];
    
    
    NSURLSessionDataTask *postDataTask = [self.session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSUInteger statusCode = ((NSHTTPURLResponse *)response).statusCode;
        
        if (statusCode != 200) {
            NSLog(@"Status code : %lu", (unsigned long)statusCode);
            NSError *error = [[NSError alloc] initWithDomain:@"Request error" code:statusCode userInfo:nil];
            failure(error);
            return;
        }
        
        if (error) {
            NSLog(@"Error %@", error);
            failure(error);
            return;
        }
        
        success(data);
    }];
    
    [postDataTask resume];
}

@end
