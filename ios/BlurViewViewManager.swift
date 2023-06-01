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
    
    private let filterType: String = "variableBlur"
    @objc var gradientMask: String = "" {
        didSet {
            if
                let data = Data(base64Encoded: gradientMask, options: .ignoreUnknownCharacters),
                let image = UIImage(data: data)
            {
                self.gradientMaskImage = image
                blurView.update(gradientMask: image, maxBlurRadius: CGFloat(truncating: maxBlurRadius), filterType: filterType)
            } else {
                print("[VariableBlurView] Couldn't create the gradient mask image.")
                let image = UIImage(systemName: "xmark")!
                blurView.update(gradientMask: image, maxBlurRadius: CGFloat(truncating: maxBlurRadius), filterType: filterType)
            }
        }
    }
    
    @objc var maxBlurRadius: NSNumber = 20 {
        didSet {
            blurView.update(gradientMask: gradientMaskImage, maxBlurRadius: maxBlurRadius.doubleValue, filterType: filterType)
        }
    }
    
    lazy var blurView = VariableBlurUIView(
        gradientMask: VariableBlurViewConstants.defaultGradientMask,
        maxBlurRadius: maxBlurRadius.doubleValue,
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
