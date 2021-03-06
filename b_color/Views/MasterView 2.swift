//
//  MasterViewNew.swift
//  b_color
//
//  Created by Dmitriy Nazarenko on 07.11.2019.
//  Copyright © 2019 Dmitriy Nazarenko. All rights reserved.
//

import SwiftUI

struct MasterView: View {
    
    @ObservedObject var viewModel: MasterListViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.masters) { master in
                MasterRow(master: master)
            }
            .alert(isPresented: $viewModel.isErrorShown, content: { () -> Alert in
                Alert(title: Text("Error"), message: Text(viewModel.errorMessage))
            }).navigationBarTitle(Text("Мастера"))
        }
        .onAppear(perform: { self.viewModel.apply(.onAppear) })
    }
}

//struct MasterViewNew_Previews: PreviewProvider {
//    static var previews: some View {
//        MasterViewNew()
//    }
//}


