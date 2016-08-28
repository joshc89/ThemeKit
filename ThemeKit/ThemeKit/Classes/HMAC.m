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

+ (NSData *)hmac:(NSString *)input withKey:(NSString *)key usingAlgorithm:(HMACAlgorithm) algorithm {
    
    NSStringEncoding encoding = NSASCIIStringEncoding;
    const char *cstrInput = [input cStringUsingEncoding:encoding];
    NSUInteger inputLength = [input lengthOfBytesUsingEncoding:encoding];
    const char *cstrKey = [key cStringUsingEncoding:encoding];
    NSUInteger keyLength = [key lengthOfBytesUsingEncoding:encoding];
    
    unsigned char chmac[[HMAC digestLengthForAlgorithm:algorithm]];
    CCHmac(kCCHmacAlgSHA1, cstrKey, keyLength, cstrInput, inputLength, &chmac);
    
    return [[NSData alloc] initWithBytes:chmac length:sizeof(chmac)];
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
