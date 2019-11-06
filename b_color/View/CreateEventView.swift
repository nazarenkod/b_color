//
//  CreateEventView.swift
//  b_color
//
//  Created by Dmitriy Nazarenko on 01.11.2019.
//  Copyright © 2019 Dmitriy Nazarenko. All rights reserved.
//

import SwiftUI

struct CreateEventView: View {
    
    @State var clientName: String = ""
    @State var phoneNumber: String = ""
    @State var instagram: String = ""
    @State var price: String = ""
    
    var selectedMaster: Master
    
    var body: some View {
        NavigationView {
            Form{
                Section(){
                    TextField("Фамилия Имя",text: $clientName)
                    TextField("Номер телефона",text: $clientName)
                    TextField("instagram",text: $clientName)
                    TextField("Цена",text: $clientName)
                }
              
                
   
            }
                 
                
            }
        
            .navigationBarTitle(Text("Мастер:  "+selectedMaster.name))
      }
        
        
        }

    
    


//struct CreateEventView_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateEventView(selectedMaster: Master)
//    }
//}
