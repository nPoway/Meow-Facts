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
        view.addShadow(.bold)
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.backgroundColor = .custom
        return view
    }()
    private let headerTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Cat Fact"
        label.addShadow(.light)
        label.font = .systemFont(ofSize: .init(60), weight: .bold)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    private let headerSubtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Press button to get fact"
        label.font = .systemFont(ofSize: .init(20), weight: .light)
        label.textColor = .black
        return label
    }()
    private let factLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: .init(20), weight: .light)
        label.numberOfLines = 0
        return label
    }()
    private let getNewFactButton: UIButton = {
        let button = UIButton()
        button.addShadow(.light)
        button.setTitle("Get fact", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
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
            mainContentView.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            mainContentView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100),
            mainContentView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            mainContentView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
        ])
        NSLayoutConstraint.activate([
            headerTitleLabel.topAnchor.constraint(equalTo: mainContentView.topAnchor, constant: 20),
            headerTitleLabel.leadingAnchor.constraint(equalTo: mainContentView.leadingAnchor),
            headerTitleLabel.trailingAnchor.constraint(equalTo: mainContentView.trailingAnchor),
            headerTitleLabel.heightAnchor.constraint(equalToConstant: 70)
        ])
        NSLayoutConstraint.activate([
            headerSubtitleLabel.topAnchor.constraint(equalTo: headerTitleLabel.bottomAnchor, constant: 20),
            headerSubtitleLabel.leadingAnchor.constraint(equalTo: mainContentView.leadingAnchor, constant: 20),
            headerSubtitleLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            factLabel.topAnchor.constraint(equalTo: headerSubtitleLabel.bottomAnchor, constant: 20),
            factLabel.leadingAnchor.constraint(equalTo: mainContentView.leadingAnchor , constant: 20),
            factLabel.trailingAnchor.constraint(equalTo: mainContentView.trailingAnchor, constant: -20),
            factLabel.widthAnchor.constraint(equalToConstant: 150)
        ])
        NSLayoutConstraint.activate([
            getNewFactButton.leadingAnchor.constraint(equalTo: mainContentView.leadingAnchor, constant: 20),
            getNewFactButton.trailingAnchor.constraint(equalTo: mainContentView.trailingAnchor, constant: -20),
            getNewFactButton.heightAnchor.constraint(equalToConstant: 50),
            getNewFactButton.bottomAnchor.constraint(equalTo: mainContentView.bottomAnchor, constant: -20)
        ])
    }
}
