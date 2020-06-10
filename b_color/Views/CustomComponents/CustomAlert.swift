//
//  CustomAlert.swift
//  b_color_refactoring
//
//  Created by Dmitriy Nazarenko on 28.04.2020.
//  Copyright © 2020 Dmitriy Nazarenko. All rights reserved.
//

import SwiftUI

struct CustomAlert<Content>: View where Content: View {
    @EnvironmentObject var eventViewModel: EventViewModel
    @Binding var date: Date
    @Binding var showSheet:Bool
    @Binding var isShowing: Bool
    var content: () -> Content
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                
                self.content()
                if self.eventViewModel.createResponse.status == "success" {
                    VStack {
                        HStack {Text("Успех").font(Font.system(size: 15, weight: .medium, design: .serif)).padding()}
                        HStack {Text("\(self.eventViewModel.createResponse.message!)").font(Font.system(size: 15, weight: .medium, design: .serif))}
                        Spacer()
                        Divider()
                        HStack {
                            Button(action: {
                                self.eventViewModel.showAlert.toggle()
                                self.showSheet.toggle()
                                self.date = Date()
                            }) {
                                Text("Ок").padding()
                            }
                        }
                    }
                        
                        
                    .frame(width: geometry.size.width / 1.3,
                           height: geometry.size.height / 4)
                        .background(Color.white)
                        .foregroundColor(Color.primary)
                        .cornerRadius(20)
                        .opacity(self.isShowing ? 1 : 0)
                        .offset(y: self.isShowing ? -UIScreen.main.bounds.height / 4 : -UIScreen.main.bounds.height)
                        .animation(.interpolatingSpring(mass: 1.0, stiffness: 100.0,damping: 10,initialVelocity:0))
                }else{
                    VStack {
                        HStack {Text("Ошибка").font(Font.system(size: 15, weight: .medium, design: .serif)).padding()}
                        HStack {Text("\(self.eventViewModel.createResponse.message!)").font(Font.system(size: 15, weight: .medium, design: .serif))}
                        Spacer()
                        Divider()
                        HStack {
                            Button(action: {
                                self.eventViewModel.showAlert.toggle()
                            }) {
                                Text("Продолжить").font(Font.system(size: 15, weight: .medium, design: .serif)).padding()
                            }
                            Spacer()
                            
                            Button(action: {
                                self.eventViewModel.showAlert.toggle()
                                self.showSheet.toggle()
                                self.date = Date()
                            }) {
                                Text("Закончить").font(Font.system(size: 15, weight: .medium, design: .serif)).padding()
                            }
                        }
                    }
                        
                        
                    .frame(width: geometry.size.width / 1.3,
                           height: geometry.size.height / 4)
                        .background(Color.white)
                        .foregroundColor(Color.primary)
                        .cornerRadius(20)
                        .opacity(self.isShowing ? 1 : 0)
                        .offset(y: self.isShowing ? -UIScreen.main.bounds.height / 4 : -UIScreen.main.bounds.height)
                        .animation(.interpolatingSpring(mass: 1.0, stiffness: 100.0,damping: 10,initialVelocity:0))
                    
                }
            }
        }
        
    }
}
