//
//  EventResponse.swift
//  b_color
//
//  Created by Dmitriy Nazarenko on 17.02.2020.
//  Copyright © 2020 Dmitriy Nazarenko. All rights reserved.
//



import Foundation
import SwiftUI


struct BaseEventResponse: Decodable {
    let status: String
    let events: [EventResponse]
    
    
}





struct EventResponse: Decodable, Identifiable, Hashable {
    let id: Int
    let clientName: String
    let phoneNumber: String
    let instagram: String
    let price: String
    let date: String
    let time: String
    let duration: String
    let master: Master
    
    
    
    
    
    public init(id: Int, clientName: String, phoneNumber: String,instagram: String, price: String, date:String,time:String,duration: String,master: Master){
        self.id = id
        self.clientName = clientName
        self.phoneNumber = phoneNumber
        self.instagram = instagram
        self.price = price
        self.date = date
        self.time = time
        self.duration = duration
        self.master = master
    }
    

    
    init(eventResponse: EventResponse) {
        self.id = eventResponse.id
        self.clientName = eventResponse.clientName
        self.phoneNumber = eventResponse.phoneNumber
        self.instagram = eventResponse.instagram
        self.price = eventResponse.price
        self.date = eventResponse.date
        self.time = eventResponse.time
        self.duration = eventResponse.duration
        self.master = eventResponse.master
    }

    


}





