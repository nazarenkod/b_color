////
////  CreateEventViewModel.swift
////  b_color
////
////  Created by Dmitriy Nazarenko on 27.11.2019.
////  Copyright © 2019 Dmitriy Nazarenko. All rights reserved.
////
//
//import Foundation
//
//
//class CreateEventViewModel: ObservableObject {
//
//   
//    
//    private var masterService: MasterService
//    
//    init() {
//        self.masterService = MasterService()
//    }
//    
//
//    
//    func createOrder(clientName: String,phoneNumber: String,instagram: String,price:String, date: Date,time: Date,duration: Date,master: Int) {
//        let event = Event(clientName: clientName,phoneNumber:phoneNumber,instagram: instagram,price: price,date: date,time: time,duration: duration, master:master )
//        self.masterService.createEvent(event: event) { _ in
//          
//           
//            
//        }
//    }
//  
//    
//    
//}
