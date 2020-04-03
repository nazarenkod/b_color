//
//  Card.swift
//  b_color
//
//  Created by Dmitriy Nazarenko on 28.02.2020.
//  Copyright © 2020 Dmitriy Nazarenko. All rights reserved.
//

import SwiftUI

struct Card: View {
    
    var event: EventResponse
  //  var test = false
    
    
    
    
    var body: some View {
      
         ZStack {
            Rectangle()
                .fill(Color.black)
                .frame(height: 120)
                .cornerRadius(10)
                .padding(8)
            .shadow(color: .gray, radius: 12)
        
            VStack {
                
                HStack {
                    Text(event.clientName)
                                 .foregroundColor(.white)
                                 .font(.subheadline)
                                 .bold()
                    
                }
                HStack {
                    Text(event.master.name)
                                        .foregroundColor(.white)
                                        .font(.subheadline)
                                        .bold()
                }
                HStack {
                               Text(event.date)
                                                   .foregroundColor(.white)
                                                   .font(.subheadline)
                                                   .bold()
                           }
                HStack {
                               Text(event.time)
                                                   .foregroundColor(.white)
                                                   .font(.subheadline)
                                                   .bold()
                           }
                HStack {
                               Text(event.duration)
                                                   .foregroundColor(.white)
                                                   .font(.subheadline)
                                                   .bold()
                           }
                
            }
            
         
//            HStack {
//                       Text(event.time)
//                                    .foregroundColor(.white)
//                                    .font(.subheadline)
//                                    .bold()
//                       
//                   }
//            HStack {
//                       Text(event.duration)
//                                    .foregroundColor(.white)
//                                    .font(.subheadline)
//                                    .bold()
//                       
//                   }

                                      
         
         
         
        }
    }


//struct Card_Previews: PreviewProvider {
//    static var previews: some View {
//        Card()
//    }
//}
}
