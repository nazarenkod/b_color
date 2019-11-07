//
//  UnidirectionalDataFlowType.swift
//  b_color
//
//  Created by Dmitriy Nazarenko on 07.11.2019.
//  Copyright © 2019 Dmitriy Nazarenko. All rights reserved.
//

import Foundation

protocol UnidirectionalDataFlowType {
    associatedtype InputType
    
    func apply(_ input: InputType)
}
