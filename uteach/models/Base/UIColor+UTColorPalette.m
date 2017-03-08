//
//  UIColor+SEColorPalette.m
//  secla
//
//  Created by Santiago Lazzari on 11/23/16.
//  Copyright © 2016 Santiago Lazzari. All rights reserved.
//

#import "UIColor+UTColorPalette.h"

@implementation UIColor (MLColorPalette)

+ (UIColor *)colorWithRed:(NSUInteger)red green:(NSUInteger)green blue:(NSUInteger)blue {
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1];
}

+ (UIColor *)utGreen {
    return [UIColor colorWithRed:121 green:239 blue:157];
}

@end
