//
//  SERequest.h
//  secla
//
//  Created by Santiago Lazzari on 11/10/16.
//  Copyright © 2016 Santiago Lazzari. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UTRequest : NSObject

@property (weak, nonatomic) NSURLSession *session;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithSession:(NSURLSession *)session;

@end
