

import Foundation
import SwiftUI
import Combine

class MasterListViewModel: ObservableObject {

    @Published var masters = [MasterViewModel]()
    
    
    init(){
        fetchMasters()
    }
    
    func fetchMasters() {
        MasterService().getAllMasters {
            masters in
            if let masters = masters {
                self.masters = masters.map(MasterViewModel.init)
            }
        }
    }
    

    }


class MasterViewModel {
    
    var master: Master
    
    init(master:Master){
        self.master = master
    }
    
    var id: Int {
        return self.master.id
    }
    
    var name: String {
        return self.master.name
    }
}
