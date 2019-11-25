//
//  MasterView.swift
//  b_color
//
//  Created by Dmitriy Nazarenko on 01.11.2019.
//  Copyright © 2019 Dmitriy Nazarenko. All rights reserved.
//

import SwiftUI

struct MasterListView: View {
 
    let masters: [MasterViewModel]
    
    init(masters : [MasterViewModel]){
        self.masters = masters
    }
    
    var body: some View {
        return
            NavigationView {
                List(masters){ master in
                    NavigationLink(destination: CreateEventView(selectedMaster: masters)){
                        MasterRow(master: master) .navigationBarTitle("Мастера")
                    }
                }
            }
            .navigationViewStyle(DoubleColumnNavigationViewStyle()).accessibility(hidden: false)
    }
}

//struct MasterView_Previews: PreviewProvider {
//    static var previews: some View {
//        MasterView()
//    }
//}
