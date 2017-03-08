//
//  SERemoteObject.h
//  secla
//
//  Created by Santiago Lazzari on 11/10/16.
//  Copyright © 2016 Santiago Lazzari. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UTRemoteObject : NSObject

@property (strong, nonatomic) NSString *host;

- (id)localObject;

@end
