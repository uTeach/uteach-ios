//
//  SEJsonRequest.m
//  secla
//
//  Created by Santiago Lazzari on 11/10/16.
//  Copyright © 2016 Santiago Lazzari. All rights reserved.
//

#import "UTGetRequest.h"

@implementation UTGetRequest

- (void)getDataFromURL:(NSString *)url success:(void (^)(id data))success failure:(void(^)(NSError *error))failure {
    [[self.session dataTaskWithURL:[NSURL URLWithString:url] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"Error %@", error);
            failure(error);
            return;
        }
        
        success(data);
    }] resume];
}

@end
