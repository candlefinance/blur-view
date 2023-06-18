import VisualEffectView

@objc(BlurViewViewManager)
final class BlurViewViewManager: RCTViewManager {
    
    override func view() -> (BlurViewView) {
        return BlurViewView()
    }
    
    @objc override static func requiresMainQueueSetup() -> Bool {
        return true
    }
}

final class BlurViewView : UIView {
    
    lazy var blurView = VisualEffectView()
    
    @objc var blurTintColor: NSString? = nil {
        didSet {
            if let blurTintColor,
               let color = UIColor(hexString: blurTintColor as String) {
                blurView.colorTint = color
            } else {
                print("Error: could not set color \(blurTintColor)")
            }
        }
    }
    
    @objc var blurRadius: NSNumber = 0 {
        didSet {
            blurView.blurRadius = CGFloat(blurRadius.doubleValue)
        }
    }
    
    @objc var blurEnabled: Bool = true {
        didSet {
            blurView.isHidden = !blurEnabled
        }
    }
    
    @objc var colorTintOpacity: NSNumber = 0 {
        didSet {
            print("set color", colorTintOpacity.doubleValue)
            blurView.colorTintAlpha = CGFloat(colorTintOpacity.doubleValue)
        }
    }
    
    @objc var scale: NSNumber = 1 {
        didSet {
            blurView.scale = scale.doubleValue
        }
    }
    
    init() {
        super.init(frame: CGRect.zero)
        
        addSubview(blurView)
        
        blurView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            blurView.topAnchor.constraint(equalTo: topAnchor),
            blurView.bottomAnchor.constraint(equalTo: bottomAnchor),
            blurView.leadingAnchor.constraint(equalTo: leadingAnchor),
            blurView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

#if os(iOS) || os(tvOS) || os(watchOS)
    import UIKit
    typealias SWColor = UIColor
#else
    import Cocoa
    typealias SWColor = NSColor
#endif

private extension Int64 {
    func duplicate4bits() -> Int64 {
        return (self << 4) + self
    }
}

/// An extension of UIColor (on iOS) or NSColor (on OSX) providing HEX color handling.
public extension SWColor {
    private convenience init?(hex3: Int64, alpha: Float) {
        self.init(red:   CGFloat( ((hex3 & 0xF00) >> 8).duplicate4bits() ) / 255.0,
                  green: CGFloat( ((hex3 & 0x0F0) >> 4).duplicate4bits() ) / 255.0,
                  blue:  CGFloat( ((hex3 & 0x00F) >> 0).duplicate4bits() ) / 255.0,
                  alpha: CGFloat(alpha))
    }

    private convenience init?(hex4: Int64, alpha: Float?) {
        self.init(red:   CGFloat( ((hex4 & 0xF000) >> 12).duplicate4bits() ) / 255.0,
                  green: CGFloat( ((hex4 & 0x0F00) >> 8).duplicate4bits() ) / 255.0,
                  blue:  CGFloat( ((hex4 & 0x00F0) >> 4).duplicate4bits() ) / 255.0,
                  alpha: alpha.map(CGFloat.init(_:)) ?? CGFloat( ((hex4 & 0x000F) >> 0).duplicate4bits() ) / 255.0)
    }

    private convenience init?(hex6: Int64, alpha: Float) {
        self.init(red:   CGFloat( (hex6 & 0xFF0000) >> 16 ) / 255.0,
                  green: CGFloat( (hex6 & 0x00FF00) >> 8 ) / 255.0,
                  blue:  CGFloat( (hex6 & 0x0000FF) >> 0 ) / 255.0, alpha: CGFloat(alpha))
    }

    private convenience init?(hex8: Int64, alpha: Float?) {
        self.init(red:   CGFloat( (hex8 & 0xFF000000) >> 24 ) / 255.0,
                  green: CGFloat( (hex8 & 0x00FF0000) >> 16 ) / 255.0,
                  blue:  CGFloat( (hex8 & 0x0000FF00) >> 8 ) / 255.0,
                  alpha: alpha.map(CGFloat.init(_:)) ?? CGFloat( (hex8 & 0x000000FF) >> 0 ) / 255.0)
    }

    /**
     Create non-autoreleased color with in the given hex string and alpha.

     - parameter hexString: The hex string, with or without the hash character.
     - parameter alpha: The alpha value, a floating value between 0 and 1.
     - returns: A color with the given hex string and alpha.
     */
    convenience init?(hexString: String, alpha: Float? = nil) {
        var hex = hexString

        // Check for hash and remove the hash
        if hex.hasPrefix("#") {
            hex = String(hex[hex.index(after: hex.startIndex)...])
        }

        guard let hexVal = Int64(hex, radix: 16) else {
            self.init()
            return nil
        }

        switch hex.count {
        case 3:
            self.init(hex3: hexVal, alpha: alpha ?? 1.0)
        case 4:
            self.init(hex4: hexVal, alpha: alpha)
        case 6:
            self.init(hex6: hexVal, alpha: alpha ?? 1.0)
        case 8:
            self.init(hex8: hexVal, alpha: alpha)
        default:
            // Note:
            // The swift 1.1 compiler is currently unable to destroy partially initialized classes in all cases,
            // so it disallows formation of a situation where it would have to.  We consider this a bug to be fixed
            // in future releases, not a feature. -- Apple Forum
            self.init()
            return nil
        }
    }

    /**
     Create non-autoreleased color with in the given hex value and alpha

     - parameter hex: The hex value. For example: 0xff8942 (no quotation).
     - parameter alpha: The alpha value, a floating value between 0 and 1.
     - returns: color with the given hex value and alpha
     */
    convenience init?(hex: Int, alpha: Float = 1.0) {
        if (0x000000 ... 0xFFFFFF) ~= hex {
            self.init(hex6: Int64(hex), alpha: alpha)
        } else {
            self.init()
            return nil
        }
    }
    
    convenience init?(argbHex: Int) {
        if (0x00000000 ... 0xFFFFFFFF) ~= argbHex {
            let hex = Int64(argbHex)
            self.init(red: CGFloat( (hex & 0x00FF0000) >> 16 ) / 255.0,
                      green: CGFloat( (hex & 0x0000FF00) >> 8 ) / 255.0,
                      blue:  CGFloat( (hex & 0x000000FF) >> 0 ) / 255.0,
                      alpha: CGFloat( (hex & 0xFF000000) >> 24 ) / 255.0)
        } else {
            self.init()
            return nil
        }
    }
    
    convenience init?(argbHexString: String) {
        var hex = argbHexString

        // Check for hash and remove the hash
        if hex.hasPrefix("#") {
            hex = String(hex[hex.index(after: hex.startIndex)...])
        }
        
        guard hex.count == 8, let hexVal = Int64(hex, radix: 16) else {
            self.init()
            return nil
        }
        self.init(red: CGFloat( (hexVal & 0x00FF0000) >> 16 ) / 255.0,
                  green: CGFloat( (hexVal & 0x0000FF00) >> 8 ) / 255.0,
                  blue:  CGFloat( (hexVal & 0x000000FF) >> 0 ) / 255.0,
                  alpha: CGFloat( (hexVal & 0xFF000000) >> 24 ) / 255.0)
    }
    
}
