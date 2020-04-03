//
//  ContentView.swift
//  b_color
//
//  Created by Dmitriy Nazarenko on 28.10.2019.
//  Copyright © 2019 Dmitriy Nazarenko. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
            EventsView()
                .onAppear(perform: {
                                      
                                        UITableView.appearance().separatorStyle = .none
                                    })
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

