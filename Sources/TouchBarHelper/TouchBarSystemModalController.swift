import Cocoa
import DFRPrivate

@available(OSX 10.12.2, *)
open class TouchBarSystemModalController: NSObject, NSTouchBarDelegate {
    
    open var touchBar: NSTouchBar?
    
    open var systemTrayItem: NSCustomTouchBarItem?
    
    override public init() {
        super.init()
        loadTouchBar()
        touchBar?.delegate = self
        touchBarDidLoad()
        showInControlStrip()
    }
    
    /// customization point
    open func loadTouchBar() {
        if touchBar == nil {
            touchBar = NSTouchBar()
        }
    }
    
    /// customization point
    open func touchBarDidLoad() {}
    
    @objc public func showInControlStrip() {
        NSTouchBar.setSystemModalShowsCloseBoxWhenFrontMost(false)
        systemTrayItem?.addToSystemTray()
        systemTrayItem?.setControlStripPresence(true)
    }
    
    @objc public func removeFromControlStrip() {
        dismiss()
        systemTrayItem?.setControlStripPresence(false)
        systemTrayItem?.removeFromSystemTray()
    }
    
    @objc public func present() {
        if let touchBar = self.touchBar, let systemTrayItem = self.systemTrayItem {
            touchBar.presentAsSystemModal(for: systemTrayItem)
        }
    }
    
    @objc public func minimize() {
        touchBar?.minimizeSystemModal()
    }
    
    @objc public func dismiss() {
        touchBar?.dismissSystemModal()
    }
}
