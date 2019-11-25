//
//  MasterService.swift
//  b_color
//
//  Created by Dmitriy Nazarenko on 25.11.2019.
//  Copyright © 2019 Dmitriy Nazarenko. All rights reserved.
//

import Foundation


class MasterService {
    
    func getAllMasters(completion: @escaping ([Master]?) -> ()) {
        
        guard let url  = URL(string: "http://192.168.31.125:8080/master/getAllMasters") else {
            DispatchQueue.main.async {
              completion(nil)
            }
        
            return
        }
        URLSession.shared.dataTask(with: url) { data,response,error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            let masters = try? JSONDecoder().decode([Master].self, from: data)
            DispatchQueue.main.async {
                completion(masters)
            }
            
            
        }.resume()
    }
}
