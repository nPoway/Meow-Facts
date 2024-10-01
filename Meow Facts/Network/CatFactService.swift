import Foundation

class CatFactService: CatFactsServiceProtocol {
    public func getCatFacts(completion: @escaping (Result<CatFact, any Error>) -> Void) {
        let url = URL(string: "https://catfact.ninja/fact")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else {
                completion(.failure(error!))
                return
            }
            
            do {
                let catFact = try JSONDecoder().decode(CatFact.self, from: data)
                completion(.success(catFact))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
