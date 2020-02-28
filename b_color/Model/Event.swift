//
//  Event.swift
//  b_color
//
//  Created by Dmitriy Nazarenko on 26.11.2019.
//  Copyright © 2019 Dmitriy Nazarenko. All rights reserved.
//

import Foundation





struct Event: Codable {
    

    let clientName: String
    let phoneNumber: String
    let instagram: String
    let price:String
    let date: String
    let time: String
    let duration: String
    let master: Int
    
    
    
    public init(clientName: String, phoneNumber: String, instagram:String, price:String,date: Date,time: Date,duration: Date,master: Int){
        
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "EEE, dd MMM yyyy hh:mm:ss +zzzz"
//
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm"
        
        let durationFormatter = DateFormatter()
        durationFormatter.dateFormat = "HH:mm"
        
       
        self.clientName = clientName
        self.phoneNumber = phoneNumber
        self.instagram = instagram
        self.price = price
        self.date = dateFormatter.string(from: date)
        self.time = timeFormatter.string(from: time)
        self.duration = durationFormatter.string(from: duration)
        self.master = master
    }
}



