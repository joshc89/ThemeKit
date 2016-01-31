//
//  NSSingleton.m
//  ThemeKit
//
//  Created by Josh Campion on 30/01/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

#import "NSSingleton.h"

@implementation NSSingleton

+(instancetype)shared
{
    static NSSingleton *shared = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[[self class] alloc] init];
    });
    
    return shared;
}

@end
