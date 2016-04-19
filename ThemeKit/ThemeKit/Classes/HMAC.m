//
//  HMAC.m
//  ThemeKit
//
//  Created by Josh Campion on 19/04/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

#import "HMAC.h"
#import <CommonCrypto/CommonHMAC.h>

@implementation HMAC

// Class methods here
+ (NSData *)calculateWithAlgorithm:(HMACAlgorithm)algorithm forKey:(const void *)key andData:(const void *)data
{
    NSInteger digestLength = [self digestLengthForAlgorithm:algorithm];
    unsigned char hmac[digestLength];
    
    CCHmac(algorithm, &key, strlen(key), &data, strlen(data), &hmac);
    
    NSData *hmacBytes = [NSData dataWithBytes:hmac length:sizeof(hmac)];
    return hmacBytes;
}

+ (NSInteger)digestLengthForAlgorithm:(HMACAlgorithm)algorithm
{
    switch (algorithm)
    {
        case MD5: return CC_MD5_DIGEST_LENGTH;
        case SHA1: return CC_SHA1_DIGEST_LENGTH;
        case SHA224: return CC_SHA224_DIGEST_LENGTH;
        case SHA256: return CC_SHA256_DIGEST_LENGTH;
        case SHA384: return CC_SHA384_DIGEST_LENGTH;
        case SHA512: return CC_SHA512_DIGEST_LENGTH;
        default: return 0;
    }
}

@end
