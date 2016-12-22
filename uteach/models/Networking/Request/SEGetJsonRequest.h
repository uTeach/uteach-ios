//
//  SEJsonRequest.h
//  secla
//
//  Created by Santiago Lazzari on 11/10/16.
//  Copyright © 2016 Santiago Lazzari. All rights reserved.
//

#import "SERequest.h"

@interface SEGetJsonRequest : SERequest

- (void)getJsonFromURL:(NSString *)url success:(void(^)(NSJSONSerialization *json))success failure:(void(^)(NSError *error))failure;
@end
