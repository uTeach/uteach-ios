//
//  SEJsonRequest.m
//  secla
//
//  Created by Santiago Lazzari on 11/10/16.
//  Copyright © 2016 Santiago Lazzari. All rights reserved.
//

#import "UTGetJsonRequest.h"

#import "UTGetRequest.h"

@implementation UTGetJsonRequest

- (void)getJsonFromURL:(NSString *)url success:(void(^)(NSJSONSerialization *json))success failure:(void(^)(NSError *error))failure {
    UTGetRequest *getRequest = [[UTGetRequest alloc] initWithSession:self.session];
    
    [getRequest getDataFromURL:url success:^(id data) {
        NSError *error;

        NSJSONSerialization *jsonSerialization = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        
        if (error) {
            failure(error);
            return;
        }
        
        success(jsonSerialization);
        
    } failure:^(NSError *error) {
        failure(error);
    }];
}

@end
