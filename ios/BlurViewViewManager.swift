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
    
    @objc var blurTintColor: String? = nil {
        didSet {
            if let blurTintColor {
                blurView.colorTint = UIColor(hex: blurTintColor)
            }
        }
    }
    
    @objc var blurRadius: NSNumber = 0 {
        didSet {
            blurView.blurRadius = blurRadius.doubleValue
        }
    }
    
    @objc var blurEnabled: Bool = true {
        didSet {
            blurView.isHidden = !blurEnabled
        }
    }
    
    @objc var colorTintOpacity: NSNumber = 0 {
        didSet {
            blurView.colorTintAlpha = colorTintOpacity.doubleValue
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

private extension UIColor {
    convenience init?(hex: String) {
        let r, g, b, a: CGFloat
        
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        
        return nil
    }
}
