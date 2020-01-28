//
//  DragingView.swift
//  Hash
//
//  Created by Billow on 2020/1/28.
//  Copyright © 2020 Billow Wang. All rights reserved.
//

import Cocoa

class DragView: NSView {
    
    var delegate: DragViewDeledate?
    
    var isReceivingDrag = false {
       didSet {
           needsDisplay = true
       }
   }
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
    }
    
    override func awakeFromNib() {
        registerForDraggedTypes([NSPasteboard.PasteboardType.fileURL])
    }
    
    
    
    override func draggingEntered(_ sender: NSDraggingInfo) -> NSDragOperation {
        return .copy
    }
    
    override func draggingExited(_ sender: NSDraggingInfo?) {
        isReceivingDrag = false
    }
    
    override func prepareForDragOperation(_ sender: NSDraggingInfo) -> Bool {
        return true
    }
    
    override func performDragOperation(_ sender: NSDraggingInfo) -> Bool {

        let pasteBoard = sender.draggingPasteboard
        let fileURL = NSURL(from: pasteBoard)! as URL
//        需要判断拖放的是否时文件
        delegate?.getFileURL(fileURL)
        return true
    }
}


protocol DragViewDeledate {
    func getFileURL(_ url: URL)
}
