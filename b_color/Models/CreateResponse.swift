//
//  BaseCreationResponse.swift
//  b_color
//
//  Created by Dmitriy Nazarenko on 03.04.2020.
//  Copyright © 2020 Dmitriy Nazarenko. All rights reserved.
//

import Foundation

struct CreateResponse: Decodable {
    let status: String
    let message: String?
    
    
    public init(status: String, message: String){
        self.status = status
        self.message = message
    }
    
    public init(createResponse: CreateResponse){
        self.status = createResponse.status
        self.message = createResponse.message
    }
    
}
