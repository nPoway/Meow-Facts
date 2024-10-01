import UIKit

class MainViewController: UIViewController {
    
    private let catFactService: CatFactsServiceProtocol = CatFactService()
    
    private let mainView = MainView()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHandler()
    }
    
    private func setupHandler() {
        mainView.buttonPressHandler = { [weak self] in
            guard let self else { return }
            self.fetchCatFact()
        }
    }
    private func fetchCatFact() {
        catFactService.getCatFacts { [weak self] result in
            guard let self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let catFact):
                    self.mainView.setupFact(catFact.fact)
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
