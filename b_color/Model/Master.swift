import Foundation
import SwiftUI


struct Master: Decodable, Identifiable {
    let id: Int
    let name: String
    
    
    
    public init(id: Int, name: String){
        self.id = id
        self.name = name
    }
    


}





