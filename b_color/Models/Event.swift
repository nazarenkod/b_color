//
//  Event.swift
//  b_color
//
//  Created by Dmitriy Nazarenko on 26.11.2019.
//  Copyright © 2019 Dmitriy Nazarenko. All rights reserved.
//

import Foundation





struct Event: Decodable,Identifiable,Encodable {
    var id: Int?
    var clientName: String?
    var phoneNumber: String?
    var instagram: String?
    var price: String?
    var date: String
    var time: String?
    var duration: String?
    var master: Master
    var procedure: Procedure?
    var additionalInfo: String?
    var freeDay: Bool
    
    
    
    
    
    public init(id: Int, clientName: String, phoneNumber: String,instagram: String, price: String, date:String,time:String,duration: String,master: Master, procedure: Procedure,additionalInfo: String,freeDay: Bool){
        self.id = id
        self.clientName = clientName
        self.phoneNumber = phoneNumber
        self.instagram = instagram
        self.price = price
        self.date = date
        self.time = time
        self.duration = duration
        self.master = master
        self.procedure = procedure
        self.additionalInfo = additionalInfo
        self.freeDay = freeDay
    }
    public init(date:String,master: Master, freeDay: Bool){
        self.id = nil
        self.clientName = nil
        self.phoneNumber = nil
        self.instagram = nil
        self.price = nil
        self.date = date
        self.time = nil
        self.duration = nil
        self.master = master
        self.procedure = nil
        self.additionalInfo = nil
        self.freeDay = freeDay
    }
    
    public init(id: Int,date:String,master: Master, freeDay: Bool){
        self.id = id
        self.clientName = nil
        self.phoneNumber = nil
        self.instagram = nil
        self.price = nil
        self.date = date
        self.time = nil
        self.duration = nil
        self.master = master
        self.procedure = nil
        self.additionalInfo = nil
        self.freeDay = freeDay
    }
    
    public init(clientName: String, phoneNumber: String,instagram: String, price: String, date:String,time:String,duration: String,master: Master, procedure: Procedure,additionalInfo: String, freeDay: Bool){
        self.id = nil
        self.clientName = clientName
        self.phoneNumber = phoneNumber
        self.instagram = instagram
        self.price = price
        self.date = date
        self.time = time
        self.duration = duration
        self.master = master
        self.procedure = procedure
        self.additionalInfo = additionalInfo
        self.freeDay = freeDay
    }
    public init(){
        self.id = 1
        self.clientName = "clientName"
        self.phoneNumber = "phoneNumber"
        self.instagram = "instagram"
        self.price = "price"
        self.date = "date"
        self.time = "time"
        self.duration = "duration"
        self.master = Master(id:1,name: "Test")
        self.procedure = Procedure(id:1,name: "Test")
        self.additionalInfo = ""
        self.freeDay = false
    }
    
    
    
    init(event: Event) {
        self.id = event.id
        self.clientName = event.clientName
        self.phoneNumber = event.phoneNumber
        self.instagram = event.instagram
        self.price = event.price
        self.date = event.date
        self.time = event.time
        self.duration = event.duration
        self.master = event.master
        self.procedure = event.procedure
        self.additionalInfo = event.additionalInfo
        self.freeDay = event.freeDay
    }
}

struct EventResponse: Decodable {
    let status: String
    let events: [Event]
    
    
    public init(status: String, events: [Event]){
        self.status = status
        self.events = events
    }
    
    public init(eventResponse: EventResponse){
        self.status = eventResponse.status
        self.events = eventResponse.events
    }
    
}



