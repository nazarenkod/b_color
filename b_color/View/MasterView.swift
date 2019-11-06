//
//  MasterView.swift
//  b_color
//
//  Created by Dmitriy Nazarenko on 01.11.2019.
//  Copyright © 2019 Dmitriy Nazarenko. All rights reserved.
//

import SwiftUI

struct MasterView: View {
    @ObservedObject var networkManager: MasterViewModel = MasterViewModel()
    var body: some View {
        //        let master1 = Master(id: 1, name: "Полина")
        //        let master2 = Master(id: 2, name: "Диана")
        //        let masters = [master1,master2]
        networkManager.load()
        return
            NavigationView {
                List(networkManager.masters){ master in
                    NavigationLink(destination: CreateEventView(selectedMaster: master)){
                        MasterRow(master: master) .navigationBarTitle("Мастера")
                    }
                }
            }
            .navigationViewStyle(DoubleColumnNavigationViewStyle()).accessibility(hidden: false)
    }
}

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        MasterView()
    }
}
