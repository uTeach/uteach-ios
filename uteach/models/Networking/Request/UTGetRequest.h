//
//  SEJsonRequest.h
//  secla
//
//  Created by Santiago Lazzari on 11/10/16.
//  Copyright © 2016 Santiago Lazzari. All rights reserved.
//

#import "UTRequest.h"

@interface UTGetRequest : UTRequest

- (void)getDataFromURL:(NSString *)url success:(void(^)(id data))success failure:(void(^)(NSError *error))failure;

@end
