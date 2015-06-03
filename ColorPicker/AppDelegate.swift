import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, NSWindowDelegate {
    var colorPanel: NSColorPanel {
        return NSColorPanel.sharedColorPanel()
    }

    var sharedApplication: NSApplication {
        return NSApplication.sharedApplication()
    }

    var userDefaults: NSUserDefaults {
        return NSUserDefaults.standardUserDefaults()
    }

    var userDefaultsController: NSUserDefaultsController {
        return NSUserDefaultsController.sharedUserDefaultsController()
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        self.colorPanel.delegate = self
        self.colorPanel.floatingPanel = self.userDefaults.boolForKey("floatingPanel")
        self.colorPanel.hidesOnDeactivate = false
        self.colorPanel.showsAlpha = true
        self.colorPanel.title = "Color Panel"

        self.colorPanel.makeKeyAndOrderFront(nil)
        self.colorPanel.bind("floatingPanel", toObject: self.userDefaultsController, withKeyPath: "values.floatingPanel", options: nil)
    }

    func windowWillClose(notification: NSNotification) {
        self.sharedApplication.terminate(nil)
    }
}
