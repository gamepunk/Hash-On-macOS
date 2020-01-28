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
    
    override func viewWillAppear() {
        super.viewWillAppear()
        updateLabels()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.        
    }
    
    func updateLabels() {
        view.window?.titlebarAppearsTransparent = true
        view.window?.styleMask.insert([.fullSizeContentView])
        view.window?.styleMask.remove([.resizable])
        view.window?.title = (detail.title.removingPercentEncoding?.components(separatedBy: "/").last)!
        md4Label.title = detail.MD4
        md5Label.title = detail.MD5
        sha1Label.title = detail.SHA1
        sha256Label.title = detail.SHA256
        sha512Label.title = detail.SHA512
    }
}
