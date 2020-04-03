//
//  EventsView.swift
//  b_color
//
//  Created by Dmitriy Nazarenko on 06.11.2019.
//  Copyright © 2019 Dmitriy Nazarenko. All rights reserved.
//

import SwiftUI

struct EventsView: View {
    @ObservedObject var masterVM = MasterViewModel()
    @EnvironmentObject var eventVM: EventViewModel
    @State  var date = Date()
    @State private var master = 0
    @State var isPresented = false
    @State var showCreateSheet = false
    @State var showEditSheet = false
    @State var eventId: Int = 0
    @State var clientName: String = ""
    @State var phoneNumber: String = ""
    @State var instagram: String = ""
    @State var price: String = ""
    @State var dateNew: String = ""
    @State var time: String = ""
    @State var duration: String = ""
  
    
  
   
    
    
 
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        
        //formatter.timeStyle = .short
        return formatter
    }
    

    
    
    
    
    var body: some View {
        let dateForm = DateFormatter()
        dateForm.dateFormat = "dd.MM.yyyy"
        
        let format = DateFormatter()
        format.dateFormat = "EEEE"
        let formattedDate = format.string(from: date)
        print("++++++++++++++++++++")
        print("events in events view \(eventVM.events)")
       // eventVM.fetchEvents()
        
   
        
      return
        NavigationView {
            LoadingView(isShowing: .constant(eventVM.loading)) {
        VStack{
            HStack{
                Text("\(self.eventId)")
                Text(formattedDate).bold()
            }
            HStack {
                      Button("Priv"){
                          self.date = Calendar.current.date(byAdding: .day, value: -1, to: self.date)!
                        self.eventVM.fetchEvents()
                      }
                Text(self.dateFormatter.string(from: self.date))
                    Button("Next"){
                      self.date = Calendar.current.date(byAdding: .day, value: 1, to: self.date)!
                        self.eventVM.fetchEvents()
                         }
                      
                  }
            Spacer()
            HStack {
                //columns
                ForEach(self.masterVM.masters) { master in
             
                    VStack {
                        
                        
                        //rows
                        List {
                            ForEach(self.eventVM.events.filter {$0.date.contains(dateForm.string(from:self.date))}) { event in
                                if event.master.id == master.id {
                                   
                                    Card(event: event).onAppear(){
                                        print("on apear")
                                        self.eventVM.fetchEvents()
                                    }
                                    
                                    
                                        .sheet(isPresented: self.$showEditSheet){
                                                                
                                            EditEventView(
                                                eventId: self.$eventId,
                                                clientName: self.$clientName,
                                                phoneNumber: self.$phoneNumber,
                                                instagram: self.$instagram,
                                                price: self.$price,
                                                date: self.$dateNew,
                                                master: self.$master,
                                                showModal: self.$showEditSheet,
                                                time: self.$time,
                                                duration : self.$duration
                                            ).environmentObject(self.eventVM)
                                    }
                                        
                                                    .gesture(
                                                                LongPressGesture()
                                                                    .onEnded { _ in
                                                                        self.eventId = event.id
                                                                        self.clientName = event.clientName
                                                                        self.phoneNumber = event.phoneNumber
                                                                        self.instagram = event.instagram
                                                                        self.price = event.price
                                                                        self.dateNew = event.date
                                                                        self.time = event.time
                                                                        self.duration = event.duration
                                                                        self.master = event.master.id
                                                                        
                                                                        self.eventVM.fetchEvents()
                                                                        self.showEditSheet.toggle()
                                                                        
                                                                }
                                                        )
                                                        
                             
                             

                                    
                            }
                                
                            }
                       
                                                    }
                    }

                        }

                }.sheet(isPresented: self.$showCreateSheet){

                    CreateEventView(showModal:self.$showCreateSheet).environmentObject(self.eventVM)}}}
            .navigationBarTitle(Text("Events"), displayMode: .large)
            .navigationBarItems(trailing:
                Button(action: {
                    self.showCreateSheet.toggle()
                }) {
                    Image(systemName: "bell.circle.fill")
                        .font(Font.system(.title))
                }
            )
        }

        .navigationViewStyle(StackNavigationViewStyle())

         
    }
}






//struct EventsView_Previews: PreviewProvider {
//    static var previews: some View {
//        EventsView()
//    }
//}
