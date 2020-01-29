//
//  DetailViewController.swift
//  Hash
//
//  Created by Billow on 2020/1/26.
//  Copyright © 2020 Billow Wang. All rights reserved.
//

import Cocoa

class DetailViewController: NSViewController {
    
    var detail: Detail!

    @IBOutlet weak var md4Label: NSTextFieldCell!
    @IBOutlet weak var md5Label: NSTextFieldCell!
    @IBOutlet weak var sha1Label: NSTextFieldCell!
    @IBOutlet weak var sha256Label: NSTextFieldCell!
    @IBOutlet weak var sha512Label: NSTextFieldCell!
    
    @IBAction func copyButtonPressed(_ sender: NSButton) {
        let pasteboard = NSPasteboard.general
        pasteboard.declareTypes([NSPasteboard.PasteboardType.string], owner: nil)
        
        switch sender.tag {
        case 0:
            pasteboard.setString(md4Label.title, forType: NSPasteboard.PasteboardType.string)
            print(md4Label.title)
        case 1:
            pasteboard.setString(md5Label.title, forType: NSPasteboard.PasteboardType.string)
            print(md5Label.title)
        case 2:
            pasteboard.setString(sha1Label.title, forType: NSPasteboard.PasteboardType.string)
            print(sha1Label.title)
        case 3:
            pasteboard.setString(sha256Label.title, forType: NSPasteboard.PasteboardType.string)
            print(sha256Label.title)
        case 4:
            pasteboard.setString(sha512Label.title, forType: NSPasteboard.PasteboardType.string)
            print(sha512Label.title)
        default:
            break
        }
    }
    
    @IBAction func exportButtonPressed(_ sender: NSButton) {
        print("Export button pressed")
        let save = NSSavePanel()
        save.canCreateDirectories = true
        save.showsTagField = false
        save.nameFieldStringValue = "hash.txt"
        save.directoryURL = URL(fileURLWithPath: "\(NSHomeDirectory())/Desktop")
        save.beginSheetModal(for: view.window!) { (result) in
            if result == NSApplication.ModalResponse.OK {
                let text = "MD4:\n\(self.md4Label.title)\nMD5:\n\(self.md5Label.title)\nSHA1:\n\(self.sha1Label.title)\nSHA256:\n\(self.sha256Label.title)\nSHA512:\n\(self.sha512Label.title)\n"
                do {
                    try text.write(to: save.url!, atomically: true, encoding: .utf8)
                } catch {
                    print("导出文件遇到错误:",error.localizedDescription)
                }
            }            
        }
        
        
        
    }
    override func viewWillAppear() {
        super.viewWillAppear()
        update()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.        
    }
    
    func update() {
        view.window?.titlebarAppearsTransparent = true
        view.window?.styleMask.insert([.fullSizeContentView])
        view.window?.styleMask.remove([.resizable])
//        view.window?
        view.window?.title = (detail.title.removingPercentEncoding?.components(separatedBy: "/").last)!
        
        md4Label.title = detail.MD4
        md5Label.title = detail.MD5
        sha1Label.title = detail.SHA1
        sha256Label.title = detail.SHA256
        sha512Label.title = detail.SHA512
    }
}
