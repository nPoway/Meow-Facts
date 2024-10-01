import Foundation

protocol CatFactsServiceProtocol {
    func getCatFacts(completion: @escaping (Result<CatFact, Error>) -> Void)
}
