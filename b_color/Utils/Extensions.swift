//
//  Extensions.swift
//  b_color_refactoring
//
//  Created by Dmitriy Nazarenko on 09.04.2020.
//  Copyright © 2020 Dmitriy Nazarenko. All rights reserved.
//

import Foundation
import UIKit



extension Date {

func toString(format: String = "dd.MM.yyyy") -> String {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.dateFormat = format
    return formatter.string(from: self)
}
    
    func toDefault() -> Date {
       
            var components = DateComponents()
            components.hour = 0
            components.minute = 0
            return Calendar.current.date(from: components) ?? Date()
    }
    
}

extension String {
    func toDate(format: String = "dd.MM.yyyy") -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.date(from: self)!
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
