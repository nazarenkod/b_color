//
//  Service.swift
//  b_color
//
//  Created by Dmitriy Nazarenko on 26.11.2019.
//  Copyright © 2019 Dmitriy Nazarenko. All rights reserved.
//

import Foundation


class MasterService {
    
    func getAllMasters(completion: @escaping ([Master]?) -> ()) {
        
        guard let url = URL(string: "http://192.168.31.125:8080/master") else {
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
            let masters = try? JSONDecoder().decode([Master].self, from: data)
            DispatchQueue.main.async {
                completion(masters)
            }
            
            
        }.resume()
    }
}
