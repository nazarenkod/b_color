//
//  ContentView.swift
//  b_color
//
//  Created by Dmitriy Nazarenko on 28.10.2019.
//  Copyright © 2019 Dmitriy Nazarenko. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var selected: Int = 1
    
    
    var body: some View {
        
        return TabView(selection: $selected) {
            EventsView()
                .tabItem {
                    CustomTabView(iconName: "1.circle", tabName: "Записи")
            }.tag(0)
            MasterView()
                .tabItem {
                    CustomTabView(iconName: "2.circle", tabName: "Добавить запись")
            }.tag(1)
            
        }.font(.headline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

