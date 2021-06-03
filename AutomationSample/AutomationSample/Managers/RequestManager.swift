//
//  RequestManager.swift
//  AutomationSample
//
//  Created by Midhunlal on 08/08/20.
//  Copyright © 2020 Midhunlal. All rights reserved.
//

import Foundation

typealias CompletionHandler = (Result) -> Void

enum Result {
    case success(_ jsonResponse: Any?)
    case failure(_ error: Any?)
}

struct ApiEndPoints {
    static var productList: String {
        return "http://demo8562465.mockable.io/ProductList"
    }
}

class RequestManager {

    static func fetchProductList(completion: @escaping CompletionHandler) {
        if let url = URL(string: ApiEndPoints.productList) {
           URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                let customError = NSError(domain: "Error", code: 999, userInfo: nil)
                completion(.failure(customError))
                return
            }
            
            do {
                let jsonData = try JSONDecoder().decode([String: [String]].self, from: data)
                let productList = jsonData["ProductList"]
                completion(.success(productList))
            } catch let error {
                completion(.failure(error))
            }
            
           }.resume()
        }
    }
}
