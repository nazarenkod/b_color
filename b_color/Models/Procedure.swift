//
//  Procedure.swift
//  b_color
//
//  Created by Dmitriy Nazarenko on 03.04.2020.
//  Copyright © 2020 Dmitriy Nazarenko. All rights reserved.
//

import Foundation
struct Procedure: Decodable, Identifiable, Hashable,Encodable {
    let id: Int
    let name: String
    
    
    
    public init(id: Int, name: String){
        self.id = id
        self.name = name
    }
    
    init(procedure: Procedure) {
        self.id = procedure.id
        self.name = procedure.name
    }
}

struct ProcedureResponse: Decodable {
    
    let status: String
    let procedures: [Procedure]
}
