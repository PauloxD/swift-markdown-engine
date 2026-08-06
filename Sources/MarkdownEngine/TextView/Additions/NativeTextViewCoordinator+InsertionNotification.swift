//
//  NativeTextViewCoordinator+InsertionNotification.swift
//  MarkdownEngine
//
//  Created by Paul on 06/08/2026.
//

import Foundation

extension NativeTextViewCoordinator {
    
    func registerForInsertionNotifications() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(handleInsertionNotification(_:)),
            name: .didRequestTextInsertion,
            object: nil
        )
    }
    
    @objc
    func handleInsertionNotification(_ notification: Notification) {
        guard let selection = self.previousSelectedRange else { return }
        if let insertionText = notification.object as? String {
            if selection.length <= 1 {
                self.textView?.insertText(insertionText, replacementRange: selection)
            }
            if selection.length > 1 {
                self.textView?.insertText(insertionText, replacementRange: selection)
            }
            
        }
    }
    
}
