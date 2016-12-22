//
//  SEPostRequest.h
//  secla
//
//  Created by Santiago Lazzari on 12/15/16.
//  Copyright © 2016 Santiago Lazzari. All rights reserved.
//

#import "SERequest.h"

@interface SEPostRequest : SERequest

- (void)postDataFromURL:(NSString *)url body:(NSString *)body success:(void(^)(NSData *data))success failure:(void(^)(NSError *error))failure;

@end
