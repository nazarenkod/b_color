

import Foundation
import SwiftUI
import Combine

public class MasterViewModel: ObservableObject {
    @Published var masters = [Master]() 
    @Published var loading = true

    
    init() {
    
        fetchMasters ()
        
        
    }
    
    func fetchMasters(){
        MasterService().getAllMasters { masters in
            if let masters = masters {
                self.masters = masters.map(Master.init)
                self.loading = false
            }
            
        }
    }
        

    
    func initMasters(){
        self.masters = [
            .init(id:3,name: "dfdfdf"),
            .init(id:4,name: "Polina")
            ]
    }
    
    
    }
    

