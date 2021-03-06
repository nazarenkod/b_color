//
//  Service.swift
//  b_color
//
//  Created by Dmitriy Nazarenko on 26.11.2019.
//  Copyright © 2019 Dmitriy Nazarenko. All rights reserved.
//

import Foundation


class MasterService {
    
    
    
    
    
    func getMasters(completion: @escaping (MasterResponse?) -> ()) {
        
        guard let url = URL(string: "https://bcolor-calendar.herokuapp.com/master") else {
            completion(nil)
            return
        }
        var request = URLRequest(url:url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data, error == nil
                
                else {
                    DispatchQueue.main.async {
                        
                        completion(nil)
                    }
                    return
            }
            let masters = try? JSONDecoder().decode(MasterResponse.self, from: data)
            DispatchQueue.main.async {
                completion(masters)
                print(masters.debugDescription)
            }
        }.resume()
    }
    
    
}
