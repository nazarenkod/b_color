//
//  EventsView.swift
//  b_color_refactoring
//
//  Created by Dmitriy Nazarenko on 08.04.2020.
//  Copyright © 2020 Dmitriy Nazarenko. All rights reserved.
//

import SwiftUI



struct EventsView: View {
    @EnvironmentObject var eventViewModel: EventViewModel
    @State var currentDate = Date()
    @State var showSheet = false
    @State var showCalendar = false
    
    
    var body: some View {
        
        
        LoadingView(isShowing: .constant(self.eventViewModel.isDataLoaded()), message: .constant("Загружаются данные...")) {
            
            
            VStack {
                
                HStack {
                    HeaderView(currentDate: self.$currentDate, showSheet: self.$showSheet,showCalendar: self.$showCalendar)
                }
                
                HStack {
                    EventsListView(currentDate: self.$currentDate).environmentObject(self.eventViewModel)
                }
                
            }.sheet(isPresented: self.$showSheet){
                CreateEventView(showSheet: self.$showSheet,date: self.$currentDate).environmentObject(self.eventViewModel)
                
            }
        }
    }
}


struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView()
    }
}
