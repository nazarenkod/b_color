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
    @Published var polina = [EventResponse]()
  

    init() {
    
        fetchEvents ()

        
    }
    
    

    
    func fetchEvents(){
        MasterService().getAllEvents { events in
            if let events = events {
                self.events = events.map(EventResponse.init)
                self.loading = false
               
            }
 
            
        }
    }
        

    
//    func initEvents(){
//        self.events = [
//            .init(id:3,name: "dfdfdf"),
//            .init(id:4,name: "Polina")
//            ]
//    }
    
    
    }
