//
//  SERequestConfigs.m
//  secla
//
//  Created by Santiago Lazzari on 11/11/16.
//  Copyright © 2016 Santiago Lazzari. All rights reserved.
//

#import "UTRequestConfigs.h"


@implementation UTRequestConfigs

#pragma mark - Init
- (instancetype)initWithBaseURL:(NSString *)baseUrl {
    if (self = [super init]) {
        self.baseUrl = baseUrl;
    }
    
    return self;    
}

@end
