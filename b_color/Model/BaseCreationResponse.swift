//
//  BaseCreationResponse.swift
//  b_color
//
//  Created by Dmitriy Nazarenko on 03.04.2020.
//  Copyright © 2020 Dmitriy Nazarenko. All rights reserved.
//

import Foundation

struct BaseCreationResponse: Decodable {
    let status: String
    let message: String
    let id: Int
    
    
    public init(status: String, message: String, id: Int){
        self.status = status
        self.message = message
        self.id = id
    }
    
    public init(baseCreationResponse: BaseCreationResponse){
        self.status = baseCreationResponse.status
        self.message = baseCreationResponse.message
        self.id = baseCreationResponse.id
    }
    
}
