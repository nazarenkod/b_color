//
//  RepositoryDetailView.swift
//  b_color
//
//  Created by Dmitriy Nazarenko on 07.11.2019.
//  Copyright © 2019 Dmitriy Nazarenko. All rights reserved.
//

import Foundation
import SwiftUI

struct CreateEventViewNew: View {
    @ObservedObject var viewModel: MasterDetailViewModel
    @State var clientName: String = ""
    @State var phoneNumber: String = ""
    @State var instagram: String = ""
    @State var price: String = ""
    
    var body: some View {
      
        NavigationView {
            Form{
                Section(){
                    TextField("Фамилия Имя",text: $clientName)
                    TextField("Номер телефона",text: $clientName)
                    TextField("instagram",text: $clientName)
                    TextField("Цена",text: $clientName)
                }
                Section(){
                    
                    Button(action: {
                        print("Taped")
                    }){
                        Text("Tap me")
                    }
                }
                
                
                
            }
            
            
        }
            
        .navigationBarTitle(Text("Мастер:  "+viewModel.masterNew.name))
    }
}

//#if DEBUG
//struct RepositoryDetailView_Previews : PreviewProvider {
//    static var previews: some View {
//        RepositoryDetailView(viewModel: .init(
//            repository: Repository(id: 1, fullName: "foo", owner:
//                User(id: 1, login: "bar", avatarUrl: URL(string: "http://baz.com")!))
//            )
//        )
//    }
//}
//#endif


