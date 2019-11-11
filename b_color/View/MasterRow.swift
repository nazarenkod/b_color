//
//  MasterRowNew.swift
//  b_color
//
//  Created by Dmitriy Nazarenko on 07.11.2019.
//  Copyright © 2019 Dmitriy Nazarenko. All rights reserved.
//

import SwiftUI

struct MasterRow: View {
    
    @State var master: Master
    
    var body: some View {
        NavigationLink(destination: CreateEventView(viewModel: .init(master: master))) {
            Text(master.name)
        }
    }
}


