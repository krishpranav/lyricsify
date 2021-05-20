//
//  AppDelegate.swift
//  lyricsify
//
//  Created by Elangovan Ayyasamy on 20/05/21.
//  Copyright © 2021 Krisna Pranav. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    let popover = NSPopover()
    let statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
    var eventMonitor: EventMonitor?
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        statusItem.image = #imageLiteral(resourceName: "StatusIcon")
        statusItem.toolTip = "Lyricsify"
        popover.contentViewController = LyricsViewController(
            nibName: "LyricsViewController",
            bundle: nil
        )
        popover.behavior = .transient
        
        if let button = statusItem.button {
            button.action = #selector(self.togglePopover(sender:))
            button.sendAction(on: [.leftMouseUp, .rightMouseUp])
        }
        
        eventMonitor = EventMonitor(mask: [.leftMouseDown, .leftMouseUp]) { event in
            if self.popover.isShown {
                self.closePopover(sender: event)
            }
        }
        eventMonitor?.start()
        
        func showPopover(sender: AnyObject?) {
            if let button = statusItem.button {
                popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSReactEdge.minY)
            }
            eventMonitor?.start()
        }
}

}
