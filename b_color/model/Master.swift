import Foundation
import SwiftUI



public class Master: Codable, Identifiable {
    public var id: Int
    public var name: String
    
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case name = "name"
    }
    
    public init(id: Int, name: String){
        self.id = id
        self.name = name
    }
    
    public init(){
        self.id = 1
        self.name = "default name"
    }

}
public typealias Masters = [Master]




