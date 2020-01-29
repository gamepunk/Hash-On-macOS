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
    
    init(url: URL) {
        self.url = url
        self.title = url.absoluteString
        self.MD4 = getMD4()
        self.MD5 = getMD5()
        self.SHA1 = getSHA1()
        self.SHA256 = getSHA256()
        self.SHA512 = getSHA512()
    }
    
    private func getMD4() -> String? {
        let bufferSize = 1024 * 1024
        do {
//            根据URL打开文件
            let file = try FileHandle(forReadingFrom: self.url)
            defer {
                file.closeFile()
            }
//            初始化内容
            var context = CC_MD4_CTX()
            CC_MD4_Init(&context)
            
//            读取文件信息
            while case let data = file.readData(ofLength: bufferSize), data.count > 0 {
                data.withUnsafeBytes {
                    _ = CC_MD4_Update(&context, $0, CC_LONG(data.count))
                }
            }

//            计算 MD4 摘要
            var digest = Data(count: Int(CC_MD4_DIGEST_LENGTH))
            digest.withUnsafeMutableBytes {
                _ = CC_MD4_Final($0, &context)
            }
            
            return digest.map { String(format: "%02hhx", $0) }.joined()
        } catch {
            print("Can't open file: \(error.localizedDescription)")
            return nil
        }
    }
    
    private func getMD5() -> String? {
                let bufferSize = 1024 * 1024
                do {
        //            根据URL打开文件
                    let file = try FileHandle(forReadingFrom: self.url)
                    defer {
                        file.closeFile()
                    }
        //            初始化内容
                    var context = CC_MD5_CTX()
                    CC_MD5_Init(&context)
                    
        //            读取文件信息
                    while case let data = file.readData(ofLength: bufferSize), data.count > 0 {
                        data.withUnsafeBytes {
                            _ = CC_MD5_Update(&context, $0, CC_LONG(data.count))
                        }
                    }

        //            计算 MD4 摘要
                    var digest = Data(count: Int(CC_MD5_DIGEST_LENGTH))
                    digest.withUnsafeMutableBytes {
                        _ = CC_MD5_Final($0, &context)
                    }
                    
                    return digest.map { String(format: "%02hhx", $0) }.joined()
                } catch {
                    print("Can't open file: \(error.localizedDescription)")
                    return nil
                }
    }
    
    private func getSHA1() -> String? {
                let bufferSize = 1024 * 1024
                do {
        //            根据URL打开文件
                    let file = try FileHandle(forReadingFrom: self.url)
                    defer {
                        file.closeFile()
                    }
        //            初始化内容
                    var context = CC_SHA1_CTX()
                    CC_SHA1_Init(&context)
                    
        //            读取文件信息
                    while case let data = file.readData(ofLength: bufferSize), data.count > 0 {
                        data.withUnsafeBytes {
                            _ = CC_SHA1_Update(&context, $0, CC_LONG(data.count))
                        }
                    }

        //            计算 MD4 摘要
                    var digest = Data(count: Int(CC_SHA1_DIGEST_LENGTH))
                    digest.withUnsafeMutableBytes {
                        _ = CC_SHA1_Final($0, &context)
                    }
                    
                    return digest.map { String(format: "%02hhx", $0) }.joined()
                } catch {
                    print("Can't open file: \(error.localizedDescription)")
                    return nil
                }
    }
    
    private func getSHA256() -> String? {
        let bufferSize = 1024 * 1024
                do {
        //            根据URL打开文件
                    let file = try FileHandle(forReadingFrom: self.url)
                    defer {
                        file.closeFile()
                    }
        //            初始化内容
                    var context = CC_SHA256_CTX()
                    CC_SHA256_Init(&context)
                    
        //            读取文件信息
                    while case let data = file.readData(ofLength: bufferSize), data.count > 0 {
                        data.withUnsafeBytes {
                            _ = CC_SHA256_Update(&context, $0, CC_LONG(data.count))
                        }
                    }

        //            计算 SHA256 摘要
                    var digest = Data(count: Int(CC_SHA256_DIGEST_LENGTH))
                    digest.withUnsafeMutableBytes {
                        _ = CC_SHA256_Final($0, &context)
                    }
                    
                    return digest.map { String(format: "%02hhx", $0) }.joined()
                } catch {
                    print("Can't open file: \(error.localizedDescription)")
                    return nil
                }
    }
    
    private func getSHA512() -> String? {
                let bufferSize = 1024 * 1024
                do {
        //            根据URL打开文件
                    let file = try FileHandle(forReadingFrom: self.url)
                    defer {
                        file.closeFile()
                    }
        //            初始化内容
                    var context = CC_SHA512_CTX()
                    CC_SHA512_Init(&context)
                    
        //            读取文件信息
                    while case let data = file.readData(ofLength: bufferSize), data.count > 0 {
                        data.withUnsafeBytes {
                            _ = CC_SHA512_Update(&context, $0, CC_LONG(data.count))
                        }
                    }

        //            计算 SHA512 摘要
                    var digest = Data(count: Int(CC_SHA512_DIGEST_LENGTH))
                    digest.withUnsafeMutableBytes {
                        _ = CC_SHA512_Final($0, &context)
                    }
                    
                    return digest.map { String(format: "%02hhx", $0) }.joined()
                } catch {
                    print("Can't open file: \(error.localizedDescription)")
                    return nil
                }
    }
}
