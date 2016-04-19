//
//  HMAC.h
//  ThemeKit
//
//  Created by Josh Campion on 19/04/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

#import <Foundation/Foundation.h>

// This enum is in HMAC.h
typedef NS_ENUM(NSInteger, HMACAlgorithm)
{
    SHA1,
    MD5,
    SHA256,
    SHA384,
    SHA512,
    SHA224
};

@interface HMAC : NSObject

+ (NSData *)hmac:(NSString *)input withKey:(NSString *)key usingAlgorithm:(HMACAlgorithm) algorithm;
+ (NSInteger)digestLengthForAlgorithm:(HMACAlgorithm)algorithm;

@end
