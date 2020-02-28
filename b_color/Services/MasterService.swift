//
//  Service.swift
//  b_color
//
//  Created by Dmitriy Nazarenko on 26.11.2019.
//  Copyright © 2019 Dmitriy Nazarenko. All rights reserved.
//

import Foundation


class MasterService {
    
    
    
    func createEvent(event: Event,  complition: @escaping (CreateEventResponse?) -> ()) {
        guard let url = URL(string: "https://bcolor-calendar.herokuapp.com/addEvent") else {

            fatalError("inavalid url")
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(event)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            print(data)
                  print(response)
                 print(error)
            guard let data = data, error == nil else{
                DispatchQueue.main.async {
                    complition(nil)
                }
                
                return
            }
            let createEventResponse = try? JSONDecoder().decode(CreateEventResponse.self,from: data)
            DispatchQueue.main.async {
                complition(createEventResponse)
            }
            
        }.resume()
        
    }
    
    func getAllMasters(completion: @escaping ([Master]?) -> ()) {
        
        guard let url = URL(string: "https://bcolor-calendar.herokuapp.com/master") else {

            completion(nil)
            return
        }
        var request = URLRequest(url:url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            print(data)
             print(response)
            print(error)
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
    
    func getAllEvents(completion: @escaping ([EventResponse]?) -> ()) {
        
        guard let url = URL(string: "https://bcolor-calendar.herokuapp.com/event") else {

            completion(nil)
            return
        }
        var request = URLRequest(url:url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            print(data)
             print(response)
            print(error)
            guard let data = data, error == nil
                
                else {
                   DispatchQueue.main.async {
                    
                             completion(nil)
                         }
                return
            }
            let events = try? JSONDecoder().decode([EventResponse].self, from: data)
            DispatchQueue.main.async {
                completion(events)
            }
            
            
        }.resume()
    }
}
