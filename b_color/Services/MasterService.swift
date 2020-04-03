//
//  Service.swift
//  b_color
//
//  Created by Dmitriy Nazarenko on 26.11.2019.
//  Copyright © 2019 Dmitriy Nazarenko. All rights reserved.
//

import Foundation


class MasterService {
    
    
    
    func createEvent(event: Event,  complition: @escaping (BaseCreationResponse?) -> ()) {
        guard let url = URL(string: "https://bcolor-calendar.herokuapp.com/addEvent") else {

            fatalError("inavalid url")
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(event)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else{
                
                DispatchQueue.main.async {
                
                    complition(nil)
                }
                
                return
            }
            let createEventResponse = try? JSONDecoder().decode(BaseCreationResponse.self,from: data)
            DispatchQueue.main.async {
                complition(createEventResponse)
                print("create event")
            }
            
        }.resume()
        
    }
    
    func editEvent(event: Event,  complition: @escaping (BaseCreationResponse?) -> ()) {
        guard let url = URL(string: "https://bcolor-calendar.herokuapp.com/editEvent") else {

            fatalError("inavalid url")
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(event)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else{
                
                DispatchQueue.main.async {
                
                    complition(nil)
                }
                
                return
            }
            let createEventResponse = try? JSONDecoder().decode(BaseCreationResponse.self,from: data)
            DispatchQueue.main.async {
                complition(createEventResponse)
                print("edit event")
            }
            
        }.resume()
        
    }
    
    func removeEvent(eventId: String,completion: @escaping (BaseCreationResponse) -> ()) {
        guard let url = URL(string: "https://bcolor-calendar.herokuapp.com/event/remove/\(eventId)") else {

            fatalError("inavalid url")
        }
        print("id for remove \(eventId)")
        print("url for remove \(url)")
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
       let task =  URLSession.shared.dataTask(with: request) { data, response, error in
       // let response
     // Check if Error took place
                if let error = error {
                    print("Error took place \(error)")
                    return
                }
                
                // Read HTTP Response Status code
                if let response = response as? HTTPURLResponse {
                    print("Response HTTP Status code: \(response.statusCode)")
                }
                
                // Convert HTTP Response Data to a simple String
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    
                    print("Response data string:\n \(dataString)")
                    let response = try? JSONDecoder().decode(BaseCreationResponse.self, from: data)
                                DispatchQueue.main.async {
                                    
                                    completion(response!)
                                }
                }
                
            }
            task.resume()
        
        
    }
    
//    func getAllMasters(completion: @escaping ([Master]?) -> ()) {
//
//        guard let url = URL(string: "https://bcolor-calendar.herokuapp.com/master") else {
//            completion(nil)
//            return
//        }
//        var request = URLRequest(url:url)
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//
//            guard let data = data, error == nil
//
//                else {
//                   DispatchQueue.main.async {
//
//                             completion(nil)
//                         }
//                return
//            }
//            let masters = try? JSONDecoder().decode([Master].self, from: data)
//            DispatchQueue.main.async {
//                completion(masters)
//            }
//
//
//        }.resume()
//    }
    
    func getAllMasters(completion: @escaping (MasterResponse?) -> ()) {
        
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
            }
            
            
        }.resume()
    }
    
    
    func getAllEvents(completion: @escaping (BaseEventResponse?) -> ()) {
        
        guard let url = URL(string: "https://bcolor-calendar.herokuapp.com/event") else {

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
            
            let response = try? JSONDecoder().decode(BaseEventResponse.self, from: data)
            if let baseEventResponse = response {
                let baseEventResponse = baseEventResponse
                DispatchQueue.main.async {
                               completion(baseEventResponse)
                           }
            } else {
                completion(nil)
            }
           
            
            
        }.resume()
    }
}
