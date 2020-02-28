//
//  EventResponse.swift
//  b_color
//
//  Created by Dmitriy Nazarenko on 17.02.2020.
//  Copyright © 2020 Dmitriy Nazarenko. All rights reserved.
//



import Foundation
import SwiftUI


struct EventResponse: Decodable, Identifiable, Hashable {
    let id: Int
    let clientName: String
    let startDateTime:String
    let endDateTime:String
    let master: Master
    
    
    
    
    
    public init(id: Int, clientName: String,startDateTime:String,endDateTime:String,master: Master){
        self.id = id
        self.clientName = clientName
        self.startDateTime = startDateTime
        self.endDateTime = startDateTime
        self.master = master
    }
    
    init(master: EventResponse) {
        self.id = master.id
        self.clientName = master.clientName
        self.startDateTime = master.startDateTime
        self.endDateTime = master.endDateTime
        self.master = master.master
    }
    


}





