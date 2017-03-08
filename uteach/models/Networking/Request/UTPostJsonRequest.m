//
//  SEPostJsonRequest.m
//  secla
//
//  Created by Santiago Lazzari on 12/20/16.
//  Copyright © 2016 Santiago Lazzari. All rights reserved.
//

#import "UTPostJsonRequest.h"

#import "UTPostRequest.h"

@implementation UTPostJsonRequest

- (void)postJsonFromURL:(NSString *)url json:(NSDictionary *)json success:(void(^)(NSData *data))success failure:(void(^)(NSError *error))failure {
    UTPostRequest *postRequest = [[UTPostRequest alloc] initWithSession:self.session];
    
    NSError * error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:json options:0 error:&error];
    NSString *jsonBody = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    
    [postRequest postDataFromURL:url body:jsonBody success:success failure:failure];
}

@end
