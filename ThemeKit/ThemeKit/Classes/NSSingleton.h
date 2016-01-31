//
//  NSSingleton.h
//  ThemeKit
//
//  Created by Josh Campion on 30/01/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 
 Simple `NSObject` subclass that returns a shared instance instantiated using:
 
    [[[self class] alloc] init];
 
 This allows swift subclasess to return `instancetype` shared instances, i.e. accessing the superclass's shared instance will return a subclass' value. This is useful for allowing shared instances to be overriden by subclasses not in the same module.
 
 */
@interface NSSingleton : NSObject

+(instancetype)shared;

@end
