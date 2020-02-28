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
    @ObservedObject var eventVM = EventViewModel()
    @State  var date = Date()
    @State private var selectedMaster = 0
   // @State var refresh: Bool = false
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }
    
    
    
    
    var body: some View {
        
//        if refresh {
//            eventVM.fetchEvents()
//            refresh = true
//        }
        
      
        
    
      return  LoadingView(isShowing: .constant(eventVM.loading)) {
            
        VStack{
            HStack {
                      Button("Priv"){
                          self.date = Calendar.current.date(byAdding: .day, value: -1, to: self.date)!
                      }
                Text(self.dateFormatter.string(from: self.date))
                    Button("Next"){
                      self.date = Calendar.current.date(byAdding: .day, value: 1, to: self.date)!
                         }
                      
                  }
            Picker(selection: self.$selectedMaster, label: Text("Datacenter")) {
                ForEach(self.masterVM.masters) { master in
                    Text(master.name).tag(master.id)
                      }
                  }
                  .pickerStyle(SegmentedPickerStyle())
            Spacer()
          
            HStack {
                //columns
                ForEach(self.masterVM.masters) { master in
                    VStack {
                        //rows
                        List {
                        ForEach(self.eventVM.events){ event in
                        
                            if event.master.id == master.id {
                                
                                   Card(title: event.clientName)
                                
                                
//                                Text(event.clientName)
//                                Text(event.master.name)
                            }
                            

                        }
                        }.onAppear(perform: {
                            self.eventVM.fetchEvents()
                            UITableView.appearance().separatorStyle = .none
                        })
                    }
                }
            }
     
  
 

            }
            

            
            
        }
      
        
        }
    }

       
    





//struct EventsView_Previews: PreviewProvider {
//    static var previews: some View {
//        EventsView()
//    }
//}
