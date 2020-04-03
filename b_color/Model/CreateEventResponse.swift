//
//  CreateOrderResponse.swift
//  b_color
//
//  Created by Dmitriy Nazarenko on 26.11.2019.
//  Copyright © 2019 Dmitriy Nazarenko. All rights reserved.
//

import Foundation


struct CreateEventResponse: Decodable{
    
    let status: String
    
    
    init(status:String) {
        self.status = status
    }
    
}
