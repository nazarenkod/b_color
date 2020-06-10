//
//  LabelTextField.swift
//  b_color_refactoring
//
//  Created by Dmitriy Nazarenko on 13.04.2020.
//  Copyright © 2020 Dmitriy Nazarenko. All rights reserved.
//

import SwiftUI

struct LabelTextField: View {
    @Binding var text: String
    var placeholder: String
    var label: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .font(.headline)
                .foregroundColor(.white)
            TextField(placeholder,text: self.$text).onTapGesture {
                UIApplication.shared.endEditing()
            }
            .foregroundColor(.black)
            .padding(10)
            .font(Font.system(size: 15, weight: .medium, design: .serif))
            .background(RoundedRectangle(cornerRadius: 10))
            .foregroundColor(.white)
            
        }.padding(.horizontal, 15)
    }
}

//struct LabelTextField_Previews: PreviewProvider {
//    static var previews: some View {
//        LabelTextField()
//    }
//}
