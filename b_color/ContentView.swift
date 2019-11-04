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

        return TabView {
                Text("Events")
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("Записи")
                }.tag(0)
                MasterView()
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Добавить запись")
                }.tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

