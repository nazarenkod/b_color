//
//  HeaderView.swift
//  b_color_refactoring
//
//  Created by Dmitriy Nazarenko on 08.04.2020.
//  Copyright © 2020 Dmitriy Nazarenko. All rights reserved.
//

import SwiftUI

struct HeaderView: View {
    @Binding var currentDate: Date
    @Binding var showSheet: Bool
    @Binding var showCalendar: Bool
    @EnvironmentObject var eventViewModel: EventViewModel
    
    var body: some View {
        
        VStack {
            HStack{
                Spacer()
                Button(action: {
                    
                    self.showSheet.toggle()
                }) {
                    Image(systemName: "plus.circle.fill")
                        .font(Font.system(.largeTitle))
                        .foregroundColor(Color.white).font(.largeTitle)
                        .padding(.horizontal, 50)
                }.padding()
            }
            
            HStack {
                Text(currentDate.toString(format: "EEEE"))
                    .foregroundColor(Color.white)
                    .font(Font.system(size: 30, weight: .medium, design: .serif))
            }.onTapGesture {self.showCalendar.toggle()}
            
            HStack {
                Button(action:{
                    self.currentDate = Calendar.current.date(byAdding: .day, value: -1, to: self.currentDate)!
                    self.eventViewModel.fetchEvents()
                        
                })
                {Image(systemName: "chevron.left.circle.fill").font(.largeTitle).padding(.horizontal, 40).foregroundColor(Color.white)}
                Text(currentDate.toString(format: "d MMMM")).foregroundColor(Color.white)
                    .font(Font.system(size: 30, weight: .medium, design: .serif))
                    .popover(
                        isPresented: self.$showCalendar,
                        arrowEdge: .top
                    ) { CalendarView(date: self.$currentDate).colorInvert()
                }
                .frame(width: 200,height: 20).onTapGesture {self.showCalendar.toggle()}
                Button(action:{
                    self.currentDate = Calendar.current.date(byAdding: .day, value: 1, to: self.currentDate)!
                    self.eventViewModel.fetchEvents()
                }
                    )
                {Image(systemName: "chevron.right.circle.fill").font(.largeTitle).padding(.horizontal, 40).foregroundColor(Color.white)}
            }
            
        }
    }
}

//struct HeaderView_Previews: PreviewProvider {
//    static var previews: some View {
//        HeaderView(currentDate: .constant(Date()))
//    }
//}
