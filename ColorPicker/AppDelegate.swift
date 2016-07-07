import Cocoa

@NSApplicationMain
internal final class AppDelegate: NSObject, NSApplicationDelegate, NSWindowDelegate {
    internal var colorPanel: NSColorPanel {
        return NSColorPanel.shared()
    }

    internal var sharedApplication: NSApplication {
        return NSApplication.shared()
    }

    internal var userDefaults: UserDefaults {
        return UserDefaults.standard
    }

    internal var userDefaultsController: NSUserDefaultsController {
        return NSUserDefaultsController.shared()
    }

    internal override func awakeFromNib() {
        super.awakeFromNib()

        self.colorPanel.delegate = self
        self.colorPanel.isFloatingPanel = self.userDefaults.bool(forKey: "floatingPanel")
        self.colorPanel.hidesOnDeactivate = false
        self.colorPanel.showsAlpha = true
        self.colorPanel.title = "Color Panel"

        self.colorPanel.makeKeyAndOrderFront(nil)
    }

    internal func windowWillClose(_ notification: Notification) {
        self.sharedApplication.terminate(nil)
    }
}
