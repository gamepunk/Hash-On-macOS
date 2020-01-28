//
//  MainViewController.swift
//  Hash
//
//  Created by Billow on 2020/1/24.
//  Copyright © 2020 Billow Wang. All rights reserved.
//

import Cocoa
import CommonCrypto

class MainViewController: NSViewController {
    

    @IBOutlet weak var dragView: DragView!
    
    @IBAction func openButtonPressed(_ sender: NSButton) {
        let open = NSOpenPanel()
        open.canChooseDirectories = false
        open.canChooseFiles = true
        open.allowsMultipleSelection = false
        open.beginSheetModal(for: view.window!) { (result) in
            if result == NSApplication.ModalResponse.OK {
                let filePath = open.urls[0]
                let detail = Detail(url: filePath)
                var detailVC: DetailViewController!
                detailVC = NSStoryboard(name: "Main", bundle: nil).instantiateController(withIdentifier: "DetailViewController") as? DetailViewController
                detailVC.detail = detail
                self.presentAsModalWindow(detailVC)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        dragView.delegate = self
        // Do any additional setup after loading the view.

    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
}

extension MainViewController: DragViewDeledate {
    func getFileURL(_ url: URL) {
        let detail = Detail(url: url)
        var detailVC: DetailViewController!
        detailVC = NSStoryboard(name: "Main", bundle: nil).instantiateController(withIdentifier: "DetailViewController") as? DetailViewController
        detailVC.detail = detail
        self.presentAsModalWindow(detailVC)
    }
}
