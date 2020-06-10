//
//  EventsListView.swift
//  b_color_refactoring
//
//  Created by Dmitriy Nazarenko on 09.04.2020.
//  Copyright © 2020 Dmitriy Nazarenko. All rights reserved.
//

import SwiftUI

struct EventsListView: View {
    
    @EnvironmentObject var eventViewModel: EventViewModel
    @Binding var currentDate: Date
    @State var showSheet = false
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal){
                VStack {
                    HStack() {
                        ForEach(self.eventViewModel.masters) { master in
                            VStack {
                                List{
                                    Text(master.name).foregroundColor(Color.white)
                                        .font(Font.system(size: 30, weight: .medium, design: .serif))
                                        .frame(maxWidth: .infinity, alignment: .center)
                                }
                                    .frame(width: self.eventViewModel.defineFrameSize(width:geometry.size.width),height: CGFloat(50),alignment: .center)
                                
                                
                            }
                        }
                    }
                    HStack {
                        ForEach(self.eventViewModel.masters) { master in
                            
                            VStack {
                                
                                
                                List{
                                    //rows
                                    ForEach(self.eventViewModel.events.filter {$0.date.contains(self.currentDate.toString(format: "dd.MM.yyyy"))}) { event in
                                        if event.master.id == master.id {
                                            
                                            HStack {
                                                Spacer()
                                                ScrollView(.vertical){
                                                    EventCardView(event: event)
                                                        .sheet(isPresented: self.$showSheet){
                                                            EditEventView(showSheet: self.$showSheet).environmentObject(self.eventViewModel)
                                                    }
                                                    .gesture(LongPressGesture().onEnded { _ in
                                                        self.eventViewModel.event = event
                                                        self.showSheet.toggle()
                                                    })
                                                    Spacer()
                                                }
                                            }
                                        }
                                    }
                                }
                                .frame(width: self.eventViewModel.defineFrameSize(width:geometry.size.width),height: geometry.size.height - 100,alignment: .center)
                            }
                        }
                    }
                    Spacer()
                }
            }
            
            //struct EventsListView_Previews: PreviewProvider {
            //    static var previews: some View {
            //        EventsListView()
            //    }
            //}
            
        }
    }
}
