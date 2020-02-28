//
//  MasterView.swift
//  b_color
//
//  Created by Dmitriy Nazarenko on 01.11.2019.
//  Copyright © 2019 Dmitriy Nazarenko. All rights reserved.
//

import SwiftUI

struct MasterView: View {
    @ObservedObject var masterVM = MasterViewModel()

    
    var body: some View {
        
        
        return
        
            LoadingView(isShowing: .constant(masterVM.loading)) {
            NavigationView {
                List(self.masterVM.masters){ master in
                    NavigationLink(destination: CreateEventView(selectedMaster: master)){
                        MasterRow(master: master) .navigationBarTitle("Мастера")
                    }
                }.onAppear(perform: {
                    UITableView.appearance().separatorStyle = .none
                })
            }
            .navigationViewStyle(DoubleColumnNavigationViewStyle()).accessibility(hidden: false)
    }
    }
}


struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        MasterView()
    }
}
