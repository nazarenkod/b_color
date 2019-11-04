//
//  MasterRow.swift
//  b_color
//
//  Created by Dmitriy Nazarenko on 01.11.2019.
//  Copyright © 2019 Dmitriy Nazarenko. All rights reserved.
//

import SwiftUI

struct MasterRow: View {
    var master: Master
    
    var body: some View {
       
        HStack{
            Text(master.name).font(.largeTitle)
           
        }
       
    }
}

//struct MasterRow_Previews: PreviewProvider {
//    static var previews: some View {
//        MasterRow(master.name: String)
//    }
//}
