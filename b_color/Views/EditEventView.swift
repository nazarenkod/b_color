//
//  EditEventView.swift
//  b_color_refactoring
//
//  Created by Dmitriy Nazarenko on 16.04.2020.
//  Copyright © 2020 Dmitriy Nazarenko. All rights reserved.
//

import SwiftUI

struct EditEventView: View {
    @EnvironmentObject var eventViewModel: EventViewModel
    @State var masterId = 0
    @State var procedureId = 0
    @Binding var showSheet:Bool
    @State var clientName = ""
    @State var phoneNumber = ""
    @State var instagram = ""
    @State var price = ""
    @State var date = Date()
    @State var time = Date()
    @State var duration = Date()
    @State var additionalInfo = ""
    @State var freeDay = false
    
    var body: some View {
        CustomAlert(date: self.$date, showSheet: self.$showSheet, isShowing: self.$eventViewModel.showAlert) {
            NavigationView {
                Form {
                    Section(header: Text("Мастер")
                        .font(Font.system(size: 15, weight: .medium, design: .serif))){
                            Picker(selection: self.$masterId, label: Text("Мастер").foregroundColor(Color.white).font(Font.system(size: 15, weight: .medium, design: .serif))) {ForEach(self.eventViewModel.masters) { master in Text(master.name).foregroundColor(Color.white)
                                }}.padding()
                            Toggle(isOn: self.$freeDay) {
                                Text("Выходной").foregroundColor(Color.white).font(Font.system(size: 15, weight: .medium, design: .serif))
                            }.padding()
                            if self.freeDay == false {
                                Picker(selection: self.$procedureId, label: Text("Процедура").foregroundColor(Color.white).font(Font.system(size: 15, weight: .medium, design: .serif))) {ForEach(self.eventViewModel.procedures) { procedure in Text(procedure.name).foregroundColor(Color.white)}}.padding()
                                
                            }else {
                                DatePicker(selection: self.$date, displayedComponents: .date) {Text("Дата").colorInvert()
                                    .font(Font.system(size: 15, weight: .medium, design: .serif))
                                    .foregroundColor(Color.white)
                                }.padding().colorInvert()
                            }
                            if self.freeDay == false {
                                Section(header: Text("Данные клиента").font(Font.system(size: 15, weight: .medium, design: .serif))){
                                    LabelTextField(text:self.$clientName,placeholder: "Имя", label: "Имя клиента")
                                    LabelTextField(text:self.$phoneNumber,placeholder: "Телефон", label: "Номер телефона")
                                    LabelTextField(text:self.$instagram,placeholder: "instagram", label: "Instagram")
                                    LabelTextField(text:self.$price,placeholder: "Цена", label: "Цена").keyboardType(.numberPad)
                                    LabelTextField(text:self.$additionalInfo,placeholder: "Дополнительная информация", label: "Дополнительная информация")
                                }
                                Section(header: Text("Дата и время").font(Font.system(size: 15, weight: .medium, design: .serif))){
                                    HStack(alignment: .center) {
                                    DatePicker(selection: self.$date, displayedComponents: .date) {Text("Дата").colorInvert()
                                        .padding(10)
                                        .font(Font.system(size: 15, weight: .medium, design: .serif))
                                        .foregroundColor(Color.white)
                                    }.colorInvert()
                                    }
                                    HStack(alignment: .center) {
                                    DatePicker(selection: self.$time, displayedComponents: .hourAndMinute) {Text("Время").colorInvert()
                                        .padding(10)
                                        .font(Font.system(size: 15, weight: .medium, design: .serif))
                                        .foregroundColor(Color.white)
                                    }.colorInvert()
                                    }
                                    HStack(alignment: .center) {
                                    DatePicker(selection: self.$duration, displayedComponents:.hourAndMinute)
                                    {Text("Продолжительность").colorInvert()
                                        .padding(10)
                                        .font(Font.system(size: 15, weight: .medium, design: .serif))
                                        .foregroundColor(Color.white)
                                    }.colorInvert()
                                    }
                                }
                            }
                            
                    }
                    HStack(){
                        Spacer()
                        if self.freeDay == false {
                            Button(action: {
                                self.eventViewModel.editEvent(id: self.eventViewModel.event.id!,clientName: self.clientName, phoneNumber: self.phoneNumber, instagram: self.instagram, price: self.price,date: self.date,time: self.time,duration: self.duration, masterId: self.masterId, procedureId: self.procedureId, additionalInfo: self.additionalInfo,freeDay: self.freeDay)
                            }
                                )
                            {Text("Изменить")}.padding(EdgeInsets(top: 12, leading: 100,bottom: 12, trailing: 100))
                                .foregroundColor(Color.black)
                                .font(Font.system(size: 25, weight: .medium, design: .serif))
                                
                                .background(self.eventViewModel.isEventValid(clientName: self.clientName, phoneNumber: self.phoneNumber, instagram: self.instagram, price: self.price, masterId: self.masterId, procedureId: self.procedureId) ? Color.green : Color.gray)
                                .cornerRadius(10)
                                .disabled( !self.eventViewModel.isEventValid(clientName: self.clientName, phoneNumber: self.phoneNumber, instagram: self.instagram, price: self.price, masterId: self.masterId, procedureId: self.procedureId) )
                        }else {
                            Button(action: {
                                self.eventViewModel.editEvent(id: self.eventViewModel.event.id!,date: self.date, masterId: self.masterId, freeDay: self.freeDay)
                            }
                                )
                            {Text("Изменить")}.padding(EdgeInsets(top: 12, leading: 100,bottom: 12, trailing: 100))
                                .foregroundColor(Color.black)
                                .font(Font.system(size: 25, weight: .medium, design: .serif))
                                .background(self.eventViewModel.isEventValid(masterId: self.masterId) ? Color.green : Color.gray)
                                .disabled( !self.eventViewModel.isEventValid(masterId: self.masterId) )
                                .cornerRadius(10)
                        }
                        Spacer()
                    }
                    
                    
                    
                    
                    
                }
                .navigationBarTitle(Text("Изменить запись"),displayMode: .large)
                .navigationBarItems(trailing:
                    Button(action: {
                        self.eventViewModel.removeEvent(eventId: self.eventViewModel.event.id!)
                        self.showSheet.toggle()
                    }) {
                        Image(systemName: "trash.circle.fill")
                            .font(Font.system(.largeTitle))
                            .foregroundColor(Color.white).font(.largeTitle)
                    }
                )
            }.navigationViewStyle(StackNavigationViewStyle())
                .onAppear() {
                    self.freeDay = self.eventViewModel.event.freeDay
                    self.masterId = self.eventViewModel.event.master.id
                    self.date = self.eventViewModel.event.date.toDate()
                    if !self.eventViewModel.event.freeDay {
                        self.procedureId = self.eventViewModel.event.procedure!.id
                        self.clientName = self.eventViewModel.event.clientName!
                        self.phoneNumber = self.eventViewModel.event.phoneNumber!
                        self.instagram = self.eventViewModel.event.instagram!
                        self.price = self.eventViewModel.event.price!
                        self.time = self.eventViewModel.event.time!.toDate(format:"HH:mm")
                        self.duration = self.eventViewModel.event.duration!.toDate(format:"HH:mm")
                        self.additionalInfo = self.eventViewModel.event.additionalInfo ?? ""
                    }
                    
            }
        }
    }
}
