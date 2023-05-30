@objc(BlurViewViewManager)
class BlurViewViewManager: RCTViewManager {
    
    override func view() -> (BlurViewView) {
        return BlurViewView()
    }
    
    @objc override static func requiresMainQueueSetup() -> Bool {
        return true
    }
}

class BlurViewView : UIView {
    
    var gradientMaskImage: UIImage = VariableBlurViewConstants.defaultGradientMask
    var _maxBlurRadius: CGFloat = 20
    
    @objc var filterType: String = "variableBlur"
    @objc var gradientMask: String = "" {
        didSet {
            if
                let data = Data(base64Encoded: gradientMask, options: .ignoreUnknownCharacters),
                let image = UIImage(data: data)
            {
                gradientMaskImage = image
            } else {
                print("[VariableBlurView] Couldn't create the gradient mask image.")
                gradientMaskImage = UIImage(systemName: "xmark")!
            }
        }
    }
    
    @objc var maxBlurRadius: NSNumber = 20 {
        didSet {
            self._maxBlurRadius = CGFloat(truncating: maxBlurRadius)
        }
    }
    
    lazy var blurView = VariableBlurUIView(
        gradientMask: gradientMaskImage,
        maxBlurRadius: _maxBlurRadius,
        filterType: filterType
    )
    
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
