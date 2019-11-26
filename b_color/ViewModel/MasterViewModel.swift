

import Foundation
import SwiftUI
import Combine

public class MasterViewModel: ObservableObject {
    @Published var masters :[Master] = []
    
    init() {
        initMasters()
    }
        

    
    func initMasters(){
        self.masters = [
            .init(id:3,name: "dfdfdf"),
            .init(id:4,name: "Polina")
            ]
    }
    
    
    }
    

