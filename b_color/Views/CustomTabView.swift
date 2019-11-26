//
//  CustomTabView.swift
//  b_color
//
//  Created by Dmitriy Nazarenko on 06.11.2019.
//  Copyright © 2019 Dmitriy Nazarenko. All rights reserved.
//

import SwiftUI

struct CustomTabView: View {
    
    let iconName: String
    let tabName: String
    
    var body: some View {
        VStack{
            Image(systemName: iconName)
            Text(tabName)
        }
        
    }
    init(iconName:String, tabName: String){
        self.iconName = iconName
        self.tabName = tabName
    }
}

//struct CustomTabView_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomTabView(iconName: , tabName: tabName)
//    }
//}
