

import Foundation
import SwiftUI
import Combine

public class MasterViewModel: ObservableObject {
    @Published var masters = [Master]() 
    @Published var loading = true
    @Published var masterResponse = MasterResponse(status: "",masters:[])
    @Published var status:String

    
    init() {
    self.status = ""
        fetchMasters ()
        
        
        
    }
    
//    func fetchMasters(){
//        MasterService().getAllMasters { masters in
//            if let masters = masters {
//                self.masters = masters.map(Master.init)
//                self.loading = false
//            }
//
//        }
//    }
        func fetchMasters(){
            MasterService().getAllMasters { masters in
                if let masters = masters {
                    self.masterResponse = masters
                    self.masters = self.masterResponse.masters.map(Master.init)
                    self.status = self.masterResponse.status
                    self.loading = false
                }
    
            }
        }
        

    
//    func initMasters(){
//        self.masters = [
//            .init(id:3,name: "dfdfdf"),
//            .init(id:4,name: "Polina")
//            ]
//    }
    
    
    }
    

