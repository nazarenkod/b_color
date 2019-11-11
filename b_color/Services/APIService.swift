//
//  APIService.swift
//  b_color
//
//  Created by Dmitriy Nazarenko on 07.11.2019.
//  Copyright © 2019 Dmitriy Nazarenko. All rights reserved.
//

import Foundation
import Combine

 protocol APIRequestType {
    associatedtype Response: Decodable
    var path: String { get }
    var queryItems: [URLQueryItem]? { get }
}


protocol APIServiceType {
    func response<Request>(from request: Request) -> AnyPublisher<Request.Response, APIServiceError> where Request: APIRequestType
}

final class APIService: APIServiceType {
  
    private let baseURL: URL
    init(baseURL: URL = URL(string: "http://192.168.31.125:8080")!) {
        self.baseURL = baseURL
     
        
    }
    
 

    func response<Request>( from request: Request) -> AnyPublisher<Request.Response, APIServiceError> where Request: APIRequestType {
    
        let pathURL = URL(string: request.path,  relativeTo: baseURL)!
        var urlComponents = URLComponents(url: pathURL, resolvingAgainstBaseURL: true)!
        urlComponents.queryItems = request.queryItems
        var request = URLRequest(url: urlComponents.url!)
      //  request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        let decorder = JSONDecoder()
        decorder.keyDecodingStrategy = .convertFromSnakeCase
        return URLSession.shared.dataTaskPublisher(for: request)
            .map { data, urlResponse in data }
            .mapError { _ in APIServiceError.responseError }
            .decode(type: Request.Response.self, decoder: decorder)
            .mapError(APIServiceError.parseError)
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}

// func load() {
//        guard let url = URL(string: "http://192.168.31.125:8080/master/") else { return }
//        var request = URLRequest(url: url)
//    request.httpMethod = "GET"
//    request.setValue("application/json",forHTTPHeaderField: "Content-Type")
//        URLSession.shared.dataTask(with: request) { (data, response, error) in
//            do {
//                guard let data = data else { return }
//                let masters = try JSONDecoder().decode(Masters.self, from: data)
//                DispatchQueue.main.async {
//                    self.masters = masters
//                }
//            } catch {
//                print("Failed To decode: ", error)
//            }
//            }.resume()
//    }
//}
