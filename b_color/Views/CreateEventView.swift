//
//  CreateEventView.swift
//  b_color
//
//  Created by Dmitriy Nazarenko on 01.11.2019.
//  Copyright © 2019 Dmitriy Nazarenko. All rights reserved.
//

import SwiftUI

struct CreateEventView: View {
    
    
    @ObservedObject var createEventVM = CreateEventViewModel()
    @ObservedObject var eventVM = EventViewModel()
    

    
    
    @State private var clientName: String = ""
    @State private var phoneNumber: String = ""
    @State private var instagram: String = ""
    @State private var price: String = ""
    @State private var date = Date()
     @State private var time = Date()
     @State private var duration = Date()
    var colors = ["Red", "Green", "Blue", "Tartan"]
      @State private var selectedColor = 0
    
    
    var selectedMaster: Master
    //var event: Event
    
    var body: some View {
        
        
        NavigationView {
//            Picker(selection: $selectedColor, label: Text("Please choose a color")) {
//                                 ForEach(0 ..< colors.count) {
//                                    Text(self.colors[$0])
//                                 }
//                                 }
            Form{
        
                Section(header: Text("Данные клиента")){
             
                    TextField("Фамилия Имя",text: self.$clientName)
                    TextField("Номер телефона",text: self.$phoneNumber)
                    TextField("instagram",text: self.$instagram)
                    TextField("Цена",text: self.$price)
                }
                
                Section(header: Text("Дата и время посещения")){
                    DatePicker(selection: self.$date, in: ...Date(), displayedComponents: .date) {
                        Text("Дата")
                    }
                    DatePicker(selection: self.$time, in: ...Date(), displayedComponents: .hourAndMinute) {
                        Text("Время")
                    }
                    DatePicker(selection: self.$duration, in: ...Date(), displayedComponents:
                        
                    .hourAndMinute) {
                        Text("Продолжительность")
                    }
                }
                

                
                HStack(){
                    Spacer()
                    Button(action: {
                        self.createEventVM.createOrder(
                            clientName: self.clientName,
                            phoneNumber: self.phoneNumber,
                            instagram: self.instagram,
                            price: self.price,
                            date: self.date,
                            time: self.time,
                            duration: self.duration,
                            master: self.selectedMaster.id
                        )
                        print(self.selectedMaster.id)
                       
                  
                    }){
                        
                        Text("Записать")
                    }.padding(EdgeInsets(top: 12, leading: 100,bottom: 12, trailing: 100))
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
                
                
                
                
                
            }
            
            
        }
            
        .navigationBarTitle(Text("Мастер:  "+self.selectedMaster.name))
    }
    
    
}







//struct CreateEventView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        CreateEventView(selectedMaster: Master(id:1,name: "fdfdf"))
//    }
//}
