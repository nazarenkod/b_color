//
//  EventViewModel.swift
//  b_color
//
//  Created by Dmitriy Nazarenko on 17.02.2020.
//  Copyright © 2020 Dmitriy Nazarenko. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

public class EventViewModel: ObservableObject {
    @Published var events = [EventResponse]()
    @Published var loading = true
    @Published var status = "error"
    
    
    

    private var masterService: MasterService
  

  

    init() {
        self.masterService = MasterService()
        fetchEvents ()
    }
    
  
    

    
    

    
    func fetchEvents(){
        MasterService().getAllEvents { events in
            if let events = events {
                DispatchQueue.main.async {
                   self.events = events.map(EventResponse.init)
                }
                
                print("events fetch \(self.events)")
                self.loading = false
                
                
               
               
            }
        }
    }
    
    func removeEvent(eventId:String){
        self.status = MasterService().removeEvent(eventId: eventId)
      
            }
    
    
    func createOrder(clientName: String,phoneNumber: String,instagram: String,price:String, date: Date,time: Date,duration: Date,master: Int) {
        let event = Event(clientName: clientName,phoneNumber:phoneNumber,instagram: instagram,price: price,date: date,time: time,duration: duration, master:master )
        self.masterService.createEvent(event: event) { _ in
          
           
            
        }
    }
    
    func editEvent(id: Int,clientName: String,phoneNumber: String,instagram: String,price:String, date: Date,time: Date,duration: Date,master: Int) {
        let event = Event(id: id,clientName: clientName,phoneNumber:phoneNumber,instagram: instagram,price: price, date: date, time: time,duration: duration, master:master )
        self.masterService.editEvent(event: event) { _ in
          
           
            
        }
    }
        }
    

        

    
//    func initEvents(){
//        self.events = [
//            .init(id:3,name: "dfdfdf"),
//            .init(id:4,name: "Polina")
//            ]
//    }
    
    

