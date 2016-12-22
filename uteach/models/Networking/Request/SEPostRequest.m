//
//  SEPostRequest.m
//  secla
//
//  Created by Santiago Lazzari on 12/15/16.
//  Copyright © 2016 Santiago Lazzari. All rights reserved.
//

#import "SEPostRequest.h"

@implementation SEPostRequest

- (void)postDataFromURL:(NSString *)url body:(NSString *)body success:(void(^)(NSData *data))success failure:(void(^)(NSError *error))failure {
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    NSString *msgLength = [NSString stringWithFormat:@"%lu", [body length]];
    
    [request setHTTPMethod:@"POST"];
    [request addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue: msgLength forHTTPHeaderField:@"Content-Length"];


    NSData *postData = [body dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:postData];
    
    
    NSURLSessionDataTask *postDataTask = [self.session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
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
