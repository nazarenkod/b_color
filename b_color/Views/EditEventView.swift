//
//  CreateEventViewTest.swift
//  b_color
//
//  Created by Dmitriy Nazarenko on 28.02.2020.
//  Copyright © 2020 Dmitriy Nazarenko. All rights reserved.
//

import SwiftUI

struct EditEventView: View {
    @Binding var eventId: Int
    @Binding var clientName:String
    @Binding var phoneNumber: String
    @Binding var instagram: String
    @Binding var price: String
    @Binding var date: String
    @Binding var master: Int
    @Binding var showModal: Bool
     @EnvironmentObject var eventVM: EventViewModel
        @ObservedObject var masterVM = MasterViewModel()

    @Binding var time:String
    @Binding var duration:String
    //@State private var selectedMaster = 0
    @State var timeNew:Date = Date()
    @State var dateNew: Date = Date()
    @State var durationNew: Date = Date()
    
    
  

        var body: some View {
            


            

          return  NavigationView {
               Form {
                    Section(header: Text("Мастер")){
                        Picker(selection: $master, label: Text("Мастер")) {ForEach(masterVM.masters) { master in Text(master.name)}}
                    }
                    Section(header: Text("Данные клиента")){
                   
                        TextField("Фамилия",text: self.$clientName)
                
                        TextField("Номер телефона",text: self.$phoneNumber)
                        TextField("instagram",text: self.$instagram)
                        TextField("Цена",text: self.$price).onAppear{
                            let dateFormatter = DateFormatter()
                               dateFormatter.dateFormat = "dd.MM.yyyy"
                            let timeFormatter = DateFormatter()
                                timeFormatter.dateFormat = "HH:mm"
                            self.dateNew = dateFormatter.date(from: self.date)!
                            self.timeNew = timeFormatter.date(from: self.time)!
                            self.durationNew = timeFormatter.date(from: self.duration)!
                            
                        }
                    }
                Section(header: Text("Дата и время посещения"))
                    {
                        
                        DatePicker(selection: self.$dateNew, displayedComponents: .date) {Text("Дата")}
                        DatePicker(selection: self.$timeNew, displayedComponents: .hourAndMinute) {Text("Время")}
                        DatePicker(selection: self.$durationNew, displayedComponents:.hourAndMinute) {Text("Продолжительность")}
                    }
                    HStack(){
                        Spacer()
                        Button(action: {
                            self.eventVM.editEvent(
                                id: self.eventId,
                                clientName: self.clientName,
                                phoneNumber: self.phoneNumber,
                                instagram: self.instagram,
                                price: self.price,
                                date: self.dateNew,
                                time: self.timeNew,
                                duration: self.durationNew,
                                master: self.master
                            )
                            self.eventVM.fetchEvents()
                                                   self.showModal.toggle()
                        }){Text("Записать")}.padding(EdgeInsets(top: 12, leading: 100,bottom: 12, trailing: 100))
                            .foregroundColor(Color.white)
                            .background(Color(red: 46/255,green: 204/255,blue:113/255))
                            .cornerRadius(10)
                            .disabled(
                                self.clientName.isEmpty ||
                                    self.phoneNumber.isEmpty ||
                                    self.instagram.isEmpty ||
                                    self.price.isEmpty
                        )
                        Spacer()
                    }
                
                }.foregroundColor(Color.blue).padding(0)
                .navigationBarTitle(Text("Редактировать запись"), displayMode: .large)
                                            .navigationBarItems(trailing:
                                                Button(action: {
                                                    self.eventVM.removeEvent(eventId: "\(self.eventId)")
                                                    self.showModal.toggle()
                                            
                                                   
                                                    
                                                  
                                                    
            
                                                }) {
                                                    Image(systemName: "trash.circle.fill")
                                                        .font(Font.system(.title))
                                                }
                                            )
              
                
                }
            .navigationViewStyle(StackNavigationViewStyle())
        }
}
        
        


//struct CreateEventViewTest_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateEventViewTest()
//    }
//}
