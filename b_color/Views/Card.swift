//
//  Card.swift
//  b_color
//
//  Created by Dmitriy Nazarenko on 28.02.2020.
//  Copyright © 2020 Dmitriy Nazarenko. All rights reserved.
//

import SwiftUI

struct Card: View {
    
    var title: String
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.black)
                .frame(height: 60)
                .cornerRadius(10)
                .padding(8)
            Text(title)
                .foregroundColor(.white)
                .font(.subheadline)
                .bold()
        }
    }
}

//struct Card_Previews: PreviewProvider {
//    static var previews: some View {
//        Card()
//    }
//}
