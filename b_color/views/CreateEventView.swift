//
//  CreateEventView.swift
//  b_color
//
//  Created by Dmitriy Nazarenko on 01.11.2019.
//  Copyright © 2019 Dmitriy Nazarenko. All rights reserved.
//

import SwiftUI

struct CreateEventView: View {
    @State var clientName: String = ""
    @State var phoneNumber: String = ""
    @State var instagram: String = ""
    @State var price: String = ""
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
        @State private var selectedDate = Date()
    
    
    var selectedMaster: Master
    
    var body: some View {
        VStack {
            HStack{
                Text("Добавить запись мастеру: ")
                Text(selectedMaster.name)
            }
            
            .font(.largeTitle)
            .foregroundColor(.red)
            Spacer()
            Form{
                Section(header: Text("Данные клиента").bold()){
                                              TextField("ФИО",text: $clientName)
                                              TextField("Номер телефона",text: $phoneNumber).textContentType(.telephoneNumber)
                                              TextField("Instagram",text: $instagram)
                                          }
                Section(header: Text("Посещение").bold()){
                                              
                                              DatePicker(selection: $selectedDate, in: Date()..., displayedComponents: .date)
                                              {
                                                  Text("Дата")
                                              }
                                              DatePicker(selection: $selectedDate, in: Date()..., displayedComponents: .hourAndMinute)
                                                                   {
                                                                       Text("Начало")
                                                                   }
                                              DatePicker(selection: $selectedDate, in: Date()..., displayedComponents: .hourAndMinute){Text("Конец")}
                                              TextField("Цена",text: $price)
                                          }
                Button(action: {
                                               print("Delete tapped!")
                                           }) {
                                               HStack {
                                                   Spacer()
                       
                                                   Image(systemName: "plus.circle")
                                                       .font(.title)
                       
                                                   Text("Записать")
                                                       .fontWeight(.semibold)
                                                       .font(.title)
                                                   Spacer()
                                               }
                                               .padding()
                                               .foregroundColor(.white)
                                               .background(Color.green)
                                               .cornerRadius(40)
                       
                                           }
                
            }
            }
     
        
        
        
        }
    
    }


//struct CreateEventView_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateEventView(selectedMaster: Master)
//    }
//}
