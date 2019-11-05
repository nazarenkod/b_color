//
//  ContentView.swift
//  b_color
//
//  Created by Dmitriy Nazarenko on 28.10.2019.
//  Copyright © 2019 Dmitriy Nazarenko. All rights reserved.
//

import SwiftUI

struct ContentView: View {
//@ObservedObject var networkManager: MasterViewModel = MasterViewModel()
//var body: some View {
//         NavigationView {
//                    List(self.networkManager.masters) { master in
//                        NavigationLink(destination: MasterRow(master: master)) {
//                           MasterRow(master: master)
//                        }
//                    }
//                    .navigationBarTitle(Text("Todo"))
//                    .navigationBarItems(leading:
//                        Button(action: {
//                            self.viewModel.shuffle()
//                        }, label: {
//                            Text("Shuffle")
//                        }), trailing:
//                        Button(action: {
//                            self.viewModel.load()
//                        }, label: {
//                            Image(systemName: "arrow.2.circlepath")
//                        })
//                    )
//                }.onAppear {
//                    self.viewModel.load()
//                }
//            }
//        }



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

