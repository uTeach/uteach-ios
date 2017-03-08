//
//  SERequestConfigs.h
//  secla
//
//  Created by Santiago Lazzari on 11/11/16.
//  Copyright © 2016 Santiago Lazzari. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UTRequestConfigs : NSObject

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithBaseURL:(NSString *)baseUrl;

@property (strong, nonatomic)NSString *baseUrl;

@end
