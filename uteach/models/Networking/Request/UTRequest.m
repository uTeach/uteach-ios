//
//  SERequest.m
//  secla
//
//  Created by Santiago Lazzari on 11/10/16.
//  Copyright © 2016 Santiago Lazzari. All rights reserved.
//

#import "UTRequest.h"

@implementation UTRequest

#pragma mark - Init
- (instancetype)initWithSession:(NSURLSession *)session {
    if (self = [super init]) {
        self.session = session;
    }
    
    return self;
}

@end
