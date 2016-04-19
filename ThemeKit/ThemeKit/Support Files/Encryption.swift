//
//  Encryption.swift
//  ThemeKit
//
//  Created by Josh Campion on 16/04/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

import Foundation

/*
enum HMACAlgorithm {
    case MD5, SHA1, SHA224, SHA256, SHA384, SHA512
    
    func hmacAlgorithm() -> CCHmacAlgorithm {
        var result: Int = 0
        switch self {
        case .MD5:
            result = kCCHmacAlgMD5
        case .SHA1:
            result = kCCHmacAlgSHA1
        case .SHA224:
            result = kCCHmacAlgSHA224
        case .SHA256:
            result = kCCHmacAlgSHA256
        case .SHA384:
            result = kCCHmacAlgSHA384
        case .SHA512:
            result = kCCHmacAlgSHA512
        }
        return CCHmacAlgorithm(result)
    }
    
    func digestLength() -> Int {
        var result: CInt = 0
        switch self {
        case .MD5:
            result = CC_MD5_DIGEST_LENGTH
        case .SHA1:
            result = CC_SHA1_DIGEST_LENGTH
        case .SHA224:
            result = CC_SHA224_DIGEST_LENGTH
        case .SHA256:
            result = CC_SHA256_DIGEST_LENGTH
        case .SHA384:
            result = CC_SHA384_DIGEST_LENGTH
        case .SHA512:
            result = CC_SHA512_DIGEST_LENGTH
        }
        return Int(result)
    }
}
*/

let secret = "laSd23jC7dl8Gb"

extension String {
    
    func digestUsingAlgorithm(algorithm: HMACAlgorithm, key: String = secret) -> String! {
        
        let hmacData = HMAC.hmac(self, withKey: key, usingAlgorithm: algorithm)
        
        return hmacData.base64EncodedStringWithOptions(.Encoding64CharacterLineLength)
    }
    
}