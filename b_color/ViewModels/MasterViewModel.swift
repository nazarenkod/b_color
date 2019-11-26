

import Foundation
import SwiftUI
import Combine

public class MasterViewModel: ObservableObject {
    @Published var masters = [Master]()
    
    init() {
        
        fetchMasters ()
    }
    
    func fetchMasters(){
        MasterService().getAllMasters { masters in
            if let masters = masters {
                self.masters = masters.map(Master.init)
                
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
    

