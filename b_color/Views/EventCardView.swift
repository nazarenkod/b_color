//
//  EventCardView.swift
//  b_color_refactoring
//
//  Created by Dmitriy Nazarenko on 09.04.2020.
//  Copyright © 2020 Dmitriy Nazarenko. All rights reserved.
//

import SwiftUI

struct EventCardView: View {
    var event: Event
    var body: some View {
        
        
        ZStack {
            VStack(alignment: .leading) {
                if event.freeDay {
                    HStack {
                        Text("Выходной").rotationEffect(.degrees(45))
                            .foregroundColor(.black)
                            .font(.system(size: 40))
                    }
                    
                } else {
                    HStack {
                        Text(event.procedure!.name)
                            .foregroundColor(.black)
                            .font(.system(size: 20))
                            .bold()
                        Spacer()
                        Text(event.time!)
                            .foregroundColor(.black)
                            .font(.subheadline)
                            .bold()
                    }
                    HStack {
                        Spacer()
                        Text(event.duration!)
                            .foregroundColor(.black)
                            .font(.subheadline)
                            .bold()
                    }
                    Spacer()
                    HStack {
                        Text(event.clientName!).foregroundColor(.black)
                        if !event.additionalInfo!.isEmpty {
                            Image(systemName:"info.circle.fill").resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.black)
                        }
                    }
                    
                    Text(event.instagram!).foregroundColor(.black)
                    HStack {
                        Text(event.phoneNumber!).foregroundColor(.black)
                        Spacer()
                        Text(event.price!).foregroundColor(.black)
                    }
                }
            }
            .padding()
        }
        .frame(width:230,height: event.freeDay ? 440:140)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: .gray, radius: 3, x: 3, y: 3)
    }
}

//struct EventCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        EventCardView()
//    }
//}

