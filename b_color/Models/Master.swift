import Foundation
import SwiftUI



struct Master: Codable, Identifiable {
    let id: Int
    let name: String
}

struct MastersResponse: Codable {
     var items: [Master]
}






