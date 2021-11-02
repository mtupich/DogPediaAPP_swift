//
//  API.swift
//  Cachorros
//
//  Created by Maria Eduarda Tupich on 27/10/21.
//

// requisição

import Foundation

class API: CachorroAPI {

    let baseURL = "https://cachorro-api.herokuapp.com"
    func setCachorrosURL() -> String {
        return "\(self.baseURL)"
    }

    func getCachorros(urlString: String, method: HTTPMethod, completion: @escaping
    (Result<[Cachorro], CachorroApiError>) -> Void) {

        var _ : [Cachorro] = []
        let config: URLSessionConfiguration = .default
        // Sessão
        let session: URLSession = URLSession(configuration: config)
        // URL
        guard let url: URL = URL(string: urlString) else { return }
        // URL Request
        var urlRequest: URLRequest = URLRequest(url: url)
        // URL Request -> Method (GET)
        urlRequest.httpMethod = "\(method)"
        // EXEC request HTTP
        let task = session.dataTask(with: urlRequest, completionHandler: { (result, urlResponse, _) in
            var statusCode: Int = 0
            if let response = urlResponse as? HTTPURLResponse {
                statusCode = response.statusCode
                print(statusCode)
            }
            guard let data = result else {
                completion(Result.failure(CachorroApiError.emptyData))
                return
            }
            do {
                // criar um decoder
                let decoder: JSONDecoder = JSONDecoder()
                // decodifircar o JSON
                let decodeData: [Cachorro] = try decoder.decode([Cachorro].self, from: data)
                completion(Result.success(decodeData))
            } catch {
                completion(Result.failure(CachorroApiError.invalidData))
            }
        }
        )
        task.resume()
    }
}
