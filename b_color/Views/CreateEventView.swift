//
//  CreateEventViewTest.swift
//  b_color
//
//  Created by Dmitriy Nazarenko on 28.02.2020.
//  Copyright © 2020 Dmitriy Nazarenko. All rights reserved.
//

import SwiftUI

struct CreateEventView: View {
      @Binding var showModal: Bool
    @EnvironmentObject var eventVM: EventViewModel
        @ObservedObject var masterVM = MasterViewModel()
        @State private var clientName: String = ""
        @State private var phoneNumber: String = ""
        @State private var instagram: String = ""
        @State private var price: String = ""
        @State private var date = Date()
         @State private var time = Date()
         @State private var duration = Date()
    @State private var selectedMaster = 0
        var body: some View {
            
            NavigationView {
               Form {
                    Section(header: Text("Мастер")){
                        Picker(selection: $selectedMaster, label: Text("Мастер")) {ForEach(masterVM.masters) { master in Text(master.name)}}
                    }
                    Section(header: Text("Данные клиента")){
                        TextField("Фамилия Имя",text: self.$clientName)
                        TextField("Номер телефона",text: self.$phoneNumber)
                        TextField("instagram",text: self.$instagram)
                        TextField("Цена",text: self.$price)
                    }
                    Section(header: Text("Дата и время посещения")){
                        DatePicker(selection: self.$date, displayedComponents: .date) {Text("Дата")}
                        DatePicker(selection: self.$time, displayedComponents: .hourAndMinute) {Text("Время")}
                        DatePicker(selection: self.$duration, displayedComponents:.hourAndMinute) {Text("Продолжительность")}
                    }
                    HStack(){
                        Spacer()
                        Button(action: {
                            self.eventVM.createOrder(
                                clientName: self.clientName,
                                phoneNumber: self.phoneNumber,
                                instagram: self.instagram,
                                price: self.price,
                                date: self.date,
                                time: self.time,
                                duration: self.duration,
                                master: self.selectedMaster
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
                .navigationBarTitle(Text("Добавить запись"), displayMode: .large)
                
                }.navigationViewStyle(StackNavigationViewStyle())
        }
}
        
        


//struct CreateEventViewTest_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateEventViewTest()
//    }
//}
