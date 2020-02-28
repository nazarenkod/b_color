import Foundation
import SwiftUI


struct Master: Decodable, Identifiable, Hashable {
    let id: Int
    let name: String
    
    
    
    public init(id: Int, name: String){
        self.id = id
        self.name = name
    }
    
    init(master: Master) {
        self.id = master.id
        self.name = master.name
    }
    


}





