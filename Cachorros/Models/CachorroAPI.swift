//
//  CachorroApi.swift
//  Cachorros
//
//  Created by Maria Eduarda Tupich on 29/10/21.
//

import Foundation

protocol CachorroAPI {
    func setCachorrosURL() -> String
    
    
    func getCachorros(urlString: String, method: HTTPMethod,
                      completion: @escaping (Result<[Cachorro], CachorroApiError>) -> Void)
}

