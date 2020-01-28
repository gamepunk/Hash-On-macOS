//
//  Detail.swift
//  Hash
//
//  Created by Billow on 2020/1/26.
//  Copyright © 2020 Billow Wang. All rights reserved.
//

import Foundation
import CommonCrypto

struct Detail {
    var url: URL!
    var title: String!
    var MD4: String!
    var MD5: String!
    var SHA1: String!
    var SHA256: String!
    var SHA512: String!
    
    init(title: String, MD4: String, MD5: String, SHA1: String, SHA256: String, SHA512:String) {
        self.title = title
        self.MD4 = MD4
        self.MD5 = MD5
        self.SHA1 = SHA1
        self.SHA256 = SHA256
        self.SHA512 = SHA512
    }
    init(url: URL) {
        self.url = url
        self.title = url.absoluteString
        self.MD4 = getMD4()
        self.MD5 = getMD5()
        self.SHA1 = getSHA1()
        self.SHA256 = getSHA256()
        self.SHA512 = getSHA512()
    }
    
    private func getMD4() -> String {
        do {
            let bufferSize = 1024 * 1024
            // Open file for reading:
            let file = try FileHandle(forReadingFrom: self.url)
            defer {
                file.closeFile()
            }
            
            // Create and initialize SHA256 context:
            var context = CC_SHA256_CTX()
            CC_SHA256_Init(&context)
            
            // Read up to `bufferSize` bytes, until EOF is reached, and update SHA256 context:
            while autoreleasepool(invoking: {
                // Read up to `bufferSize` bytes
                let data = file.readData(ofLength: bufferSize)
                if data.count > 0 {
                    data.withUnsafeBytes {
                        _ = CC_SHA256_Update(&context, $0, numericCast(data.count))
                    }
                    // Continue
                    return true
                } else {
                    // End of file
                    return false
                }
            }) { }
            
            // Compute the SHA256 digest:
            var digest = Data(count: Int(CC_SHA256_DIGEST_LENGTH))
            digest.withUnsafeMutableBytes {
                _ = CC_SHA256_Final($0, &context)
            }
            
            let calculatedHash = digest.map { String(format: "%02hhx", $0) }.joined()
            return calculatedHash
        } catch {
            return ""
        }
    }
    
    private func getMD5() -> String? {
        do {
            let bufferSize = 1024 * 1024
            // Open file for reading:
            let file = try FileHandle(forReadingFrom: self.url)
            defer {
                file.closeFile()
            }
            
            // Create and initialize SHA256 context:
            var context = CC_SHA256_CTX()
            CC_SHA256_Init(&context)
            
            // Read up to `bufferSize` bytes, until EOF is reached, and update SHA256 context:
            while autoreleasepool(invoking: {
                // Read up to `bufferSize` bytes
                let data = file.readData(ofLength: bufferSize)
                if data.count > 0 {
                    data.withUnsafeBytes {
                        _ = CC_SHA256_Update(&context, $0, numericCast(data.count))
                    }
                    // Continue
                    return true
                } else {
                    // End of file
                    return false
                }
            }) { }
            
            // Compute the SHA256 digest:
            var digest = Data(count: Int(CC_SHA256_DIGEST_LENGTH))
            digest.withUnsafeMutableBytes {
                _ = CC_SHA256_Final($0, &context)
            }
            
            let calculatedHash = digest.map { String(format: "%02hhx", $0) }.joined()
            return calculatedHash
        } catch {
            print(error)
            return "nil"
        }
    }
    
    private func getSHA1() -> String {
        do {
            let bufferSize = 1024 * 1024
            // Open file for reading:
            let file = try FileHandle(forReadingFrom: self.url)
            defer {
                file.closeFile()
            }
            
            // Create and initialize SHA256 context:
            var context = CC_SHA256_CTX()
            CC_SHA256_Init(&context)
            
            // Read up to `bufferSize` bytes, until EOF is reached, and update SHA256 context:
            while autoreleasepool(invoking: {
                // Read up to `bufferSize` bytes
                let data = file.readData(ofLength: bufferSize)
                if data.count > 0 {
                    data.withUnsafeBytes {
                        _ = CC_SHA256_Update(&context, $0, numericCast(data.count))
                    }
                    // Continue
                    return true
                } else {
                    // End of file
                    return false
                }
            }) { }
            
            // Compute the SHA256 digest:
            var digest = Data(count: Int(CC_SHA256_DIGEST_LENGTH))
            digest.withUnsafeMutableBytes {
                _ = CC_SHA256_Final($0, &context)
            }
            let calculatedHash = digest.map { String(format: "%02hhx", $0) }.joined()
            return calculatedHash
        } catch {
            print(error)
            return "nil"
        }
    }
    
    private func getSHA256() -> String? {
        do {
            let bufferSize = 1024 * 1024
            // Open file for reading:
            let file = try FileHandle(forReadingFrom: self.url)
            defer {
                file.closeFile()
            }
            
            // Create and initialize SHA256 context:
            var context = CC_SHA256_CTX()
            CC_SHA256_Init(&context)
            
            // Read up to `bufferSize` bytes, until EOF is reached, and update SHA256 context:
            while autoreleasepool(invoking: {
                // Read up to `bufferSize` bytes
                let data = file.readData(ofLength: bufferSize)
                if data.count > 0 {
                    data.withUnsafeBytes {
                        _ = CC_SHA256_Update(&context, $0, numericCast(data.count))
                    }
                    // Continue
                    return true
                } else {
                    // End of file
                    return false
                }
            }) { }
            
            // Compute the SHA256 digest:
            var digest = Data(count: Int(CC_SHA256_DIGEST_LENGTH))
            digest.withUnsafeMutableBytes {
                _ = CC_SHA256_Final($0, &context)
            }
            
            let calculatedHash = digest.map { String(format: "%02hhx", $0) }.joined()
            return calculatedHash
        } catch {
            print(error)
            return "nil"
        }
    }
    
    private func getSHA512() -> String {
        do {
            let bufferSize = 1024 * 1024
            // Open file for reading:
            let file = try FileHandle(forReadingFrom: self.url)
            defer {
                file.closeFile()
            }
            
            // Create and initialize SHA256 context:
            var context = CC_SHA256_CTX()
            CC_SHA256_Init(&context)
            
            // Read up to `bufferSize` bytes, until EOF is reached, and update SHA256 context:
            while autoreleasepool(invoking: {
                // Read up to `bufferSize` bytes
                let data = file.readData(ofLength: bufferSize)
                if data.count > 0 {
                    data.withUnsafeBytes {
                        _ = CC_SHA256_Update(&context, $0, numericCast(data.count))
                    }
                    // Continue
                    return true
                } else {
                    // End of file
                    return false
                }
            }) { }
            
            // Compute the SHA256 digest:
            var digest = Data(count: Int(CC_SHA256_DIGEST_LENGTH))
            digest.withUnsafeMutableBytes {
                _ = CC_SHA256_Final($0, &context)
            }
            
            let calculatedHash = digest.map { String(format: "%02hhx", $0) }.joined()
            return calculatedHash
        } catch {
            print(error)
            return "nil"
        }
    }
}
