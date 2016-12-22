//
//  SEPostJsonRequest.h
//  secla
//
//  Created by Santiago Lazzari on 12/20/16.
//  Copyright © 2016 Santiago Lazzari. All rights reserved.
//

#import "SERequest.h"

@interface SEPostJsonRequest : SERequest

- (void)postJsonFromURL:(NSString *)url json:(NSDictionary *)dict success:(void(^)(NSData *data))success failure:(void(^)(NSError *error))failure;

@end
