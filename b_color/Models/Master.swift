//
//  MasterResponse.swift
//  b_color_refactoring
//
//  Created by Dmitriy Nazarenko on 08.04.2020.
//  Copyright © 2020 Dmitriy Nazarenko. All rights reserved.
//

import Foundation


struct Master: Decodable, Identifiable, Hashable,Encodable {
    let id: Int
    let name: String
    
    
    
    public init(id: Int, name: String){
        self.id = id
        self.name = name
    }
    
    init(master: Master) {
        self.id = master.id
        self.name = master.name
    }
}

struct MasterResponse: Decodable {
    
    let status: String
    let masters: [Master]
    
}
