import UIKit

class MainView: UIView {
    
    public var buttonPressHandler: (() -> Void)?
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let mainContentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white.withAlphaComponent(0.9)
        view.layer.cornerRadius = 20
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.2
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
        view.layer.shadowRadius = 10
        return view
    }()
    
    private let headerTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Cat Fact"
        label.font = UIFont.systemFont(ofSize: 48, weight: .heavy)
        label.textAlignment = .center
        label.textColor = UIColor(named: "primaryTextColor") ?? .black
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowOpacity = 0.1
        label.layer.shadowOffset = CGSize(width: 0, height: 3)
        label.layer.shadowRadius = 4
        return label
    }()
    
    private let headerSubtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Press the button to get a new fact"
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textAlignment = .center
        label.textColor = UIColor.darkGray
        return label
    }()
    
    private let factLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.numberOfLines = 0
        label.textColor = UIColor(named: "secondaryTextColor") ?? .black
        label.textAlignment = .center
        return label
    }()
    
    private let getNewFactButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Get New Fact", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = UIColor.systemBlue
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.systemTeal.cgColor, UIColor.systemBlue.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.cornerRadius = 25
        button.layer.insertSublayer(gradientLayer, at: 0)
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        setupAction()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupFact(_ fact: String) {
        factLabel.text = fact
    }
    
    private func setupAction() {
        getNewFactButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    @objc
    private func buttonPressed() {
        buttonPressHandler?()
    }
    
    private func setupLayout() {
        addSubview(backgroundImageView)
        addSubview(mainContentView)
        mainContentView.addSubview(headerTitleLabel)
        mainContentView.addSubview(headerSubtitleLabel)
        mainContentView.addSubview(factLabel)
        mainContentView.addSubview(getNewFactButton)
        
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        mainContentView.translatesAutoresizingMaskIntoConstraints = false
        headerSubtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        headerTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        getNewFactButton.translatesAutoresizingMaskIntoConstraints = false
        factLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            mainContentView.topAnchor.constraint(equalTo: self.topAnchor, constant: 150),
            mainContentView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -150),
            mainContentView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            mainContentView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            headerTitleLabel.topAnchor.constraint(equalTo: mainContentView.topAnchor, constant: 30),
            headerTitleLabel.leadingAnchor.constraint(equalTo: mainContentView.leadingAnchor, constant: 20),
            headerTitleLabel.trailingAnchor.constraint(equalTo: mainContentView.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            headerSubtitleLabel.topAnchor.constraint(equalTo: headerTitleLabel.bottomAnchor, constant: 10),
            headerSubtitleLabel.leadingAnchor.constraint(equalTo: mainContentView.leadingAnchor, constant: 20),
            headerSubtitleLabel.trailingAnchor.constraint(equalTo: mainContentView.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            factLabel.topAnchor.constraint(equalTo: headerSubtitleLabel.bottomAnchor, constant: 20),
            factLabel.leadingAnchor.constraint(equalTo: mainContentView.leadingAnchor, constant: 20),
            factLabel.trailingAnchor.constraint(equalTo: mainContentView.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            getNewFactButton.topAnchor.constraint(equalTo: factLabel.bottomAnchor, constant: 20),
            getNewFactButton.leadingAnchor.constraint(equalTo: mainContentView.leadingAnchor, constant: 40),
            getNewFactButton.trailingAnchor.constraint(equalTo: mainContentView.trailingAnchor, constant: -40),
            getNewFactButton.heightAnchor.constraint(equalToConstant: 50),
            getNewFactButton.bottomAnchor.constraint(equalTo: mainContentView.bottomAnchor, constant: -30)
        ])
    }
}
