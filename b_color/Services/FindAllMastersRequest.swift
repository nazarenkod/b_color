//
//  SearchRepositoryRequest.swift
//  b_color
//
//  Created by Dmitriy Nazarenko on 07.11.2019.
//  Copyright © 2019 Dmitriy Nazarenko. All rights reserved.
//

import Foundation

struct FindAllMastersRequest: APIRequestType {
 
    
    typealias Response = FindAllMastersResponse
    
    
    var path: String { return "master" }
   // var method: String {return "GET"}
    var queryItems: [URLQueryItem]? {
        return [
            .init(name: "q", value: "SwiftUI"),
            .init(name: "order", value: "desc")
        ]
    }
}
