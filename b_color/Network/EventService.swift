//
//  Service.swift
//  b_color
//
//  Created by Dmitriy Nazarenko on 26.11.2019.
//  Copyright © 2019 Dmitriy Nazarenko. All rights reserved.
//

import Foundation


class EventService {
    
    
    
    func createEvent(event: Event,  complition: @escaping (CreateResponse?) -> ()) {
        guard let url = URL(string: "https://bcolor-calendar.herokuapp.com/addEvent") else {
            
            fatalError("inavalid url")
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        print("create body \(event)")
        request.httpBody = try? JSONEncoder().encode(event)
        let string = String(data: request.httpBody!, encoding: .utf8)!
        print("datadfdfdf \(string)")
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data, error == nil else{
                
                DispatchQueue.main.async {
                    
                    complition(nil)
                }
                
                return
            }
            print("\(data)")
            let createEventResponse = try? JSONDecoder().decode(CreateResponse.self,from: data)
            DispatchQueue.main.sync {
                complition(createEventResponse)
            }
            
        }.resume()
        
    }
    
    func editEvent(event: Event,  complition: @escaping (CreateResponse?) -> ()) {
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
            let createEventResponse = try? JSONDecoder().decode(CreateResponse.self,from: data)
            print("editEventResponse \(createEventResponse.debugDescription)")
            DispatchQueue.main.async {
                complition(createEventResponse)
                print("edit event")
            }
            
        }.resume()
        
    }
    
    func removeEvent(eventId: Int,completion: @escaping (CreateResponse) -> ()) {
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
                let response = try? JSONDecoder().decode(CreateResponse.self, from: data)
                DispatchQueue.main.async {
                    
                    completion(response!)
                }
            }
            
        }
        task.resume()
        
        
    }
    
    
    func getEvents(completion: @escaping (EventResponse?) -> ()) {
        
        guard let url = URL(string: "https://bcolor-calendar.herokuapp.com/event") else {
            
            completion(nil)
            return
        }
        var request = URLRequest(url:url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            print(error.debugDescription)
            print(data.debugDescription)
            print(response.debugDescription)
            guard let data = data, error == nil
                
                else {
                    DispatchQueue.main.async {
                        
                        completion(nil)
                    }
                    return
            }
            
            let response = try? JSONDecoder().decode(EventResponse.self, from: data)
            if let eventResponse = response {
                let eventResponse = eventResponse
                DispatchQueue.main.async {
                    print("events \(eventResponse.events.debugDescription)")
                    completion(eventResponse)
                }
            } else {
                completion(nil)
            }
            
            
            
        }.resume()
    }
}
