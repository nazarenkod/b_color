

import Foundation
import SwiftUI
import Combine

public class MasterViewModel: ObservableObject {
    

    
    @Published var masters = [Master]()
    

    
    func shuffle(){
        self.masters = self.masters.shuffled()
    }
    
    
     func load() {
            guard let url = URL(string: "http://192.168.31.125:8080/master/") else { return }
            var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json",forHTTPHeaderField: "Content-Type")
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                do {
                    guard let data = data else { return }
                    let masters = try JSONDecoder().decode(Masters.self, from: data)
                    DispatchQueue.main.async {
                        self.masters = masters
                    }
                } catch {
                    print("Failed To decode: ", error)
                }
                }.resume()
        }
    }
