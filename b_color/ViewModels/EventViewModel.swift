

import Foundation
import SwiftUI
import Combine

public class EventViewModel: ObservableObject {
    @Published var masters = [Master]()
    @Published var events = [Event]()
    @Published var procedures  = [Procedure]()
    @Published var loadingMasters = true
    @Published var loadingEvents = true
    @Published var loadingProcedures = true
    @Published var removingEvent = true
    @Published var creatingEvent = true
    @Published var editingEvent = true
    @Published var showAlert = false
    @Published var masterResponse = MasterResponse(status: "",masters:[])
    @Published var eventResponse = EventResponse(status: "",events:[])
    @Published var procedureResponse = ProcedureResponse(status: "",procedures:[])
    @Published var createResponse = CreateResponse(status: "", message: "")
    @Published var event = Event()
    private var masterService: MasterService = MasterService()
    private var eventService: EventService = EventService()
    private var procedureService: ProcedureService = ProcedureService()
    
    
    
    
    init() {
        fetchMasters()
        fetchEvents()
        fetchProcedures()
        
        
    }
    
    func isEventValid(clientName: String,phoneNumber: String, instagram: String, price: String,masterId: Int,procedureId: Int) -> Bool {
        return (!clientName.isEmpty || (!phoneNumber.isEmpty && phoneNumber != "+38") || (!instagram.isEmpty && instagram != "@")) && !price.isEmpty && !(masterId == 0)  && !(procedureId == 0)
        
    }
    func isEventValid(masterId: Int) -> Bool {
        return (!(masterId == 0))
        
    }
    
    
    
    func fetchMasters(){
        masterService.getMasters { masterResponse in
            if let masterResponse = masterResponse {
                self.masterResponse = masterResponse
                if self.masterResponse.status == "success"{
                    self.masters = self.masterResponse.masters.map(Master.init)
                    self.loadingMasters.toggle()
                }
            }
        }
    }
    func fetchEvents(){
        eventService.getEvents { eventResponse in
            print("events respone \(eventResponse.debugDescription)")
            self.eventResponse = eventResponse!
            self.events = self.eventResponse.events
            if self.eventResponse.status == "success"{
                self.loadingEvents.toggle()
            }
        }
    }
    func removeEvent(eventId:Int){
        eventService.removeEvent(eventId: eventId) { response in
            self.createResponse = response
            if self.createResponse.status == "success" {
                self.fetchEvents()
                self.removingEvent.toggle()
            }
        }
    }
    func createEvent(clientName: String,phoneNumber: String,instagram: String,price:String, date: Date,time: Date,duration: Date,masterId: Int,procedureId: Int,additionalInfo: String, freeDay: Bool) {
        let procedure = procedures.first(where: {$0.id == procedureId})
        let master = masters.first(where: {$0.id == masterId})
        let event = Event(clientName: clientName,phoneNumber:phoneNumber,instagram: instagram,price: price,date: date.toString(format:"dd.MM.yyyy"),time: time.toString(format:"HH:mm"),duration: duration.toString(format:"HH:mm"), master:Master.init(master: master!), procedure: Procedure.init(procedure: procedure!),additionalInfo: additionalInfo,freeDay: freeDay )
        eventService.createEvent(event: event) { response in
            self.createResponse = response!
            self.showAlert.toggle()
            if self.createResponse.status == "success"{
                self.fetchEvents()
                self.creatingEvent.toggle()
            }
            
        }
        
    }
    
    func createEvent(date: Date,masterId: Int, freeDay: Bool) {
        let master = masters.first(where: {$0.id == masterId})
        let event = Event(date: date.toString(format:"dd.MM.yyyy"), master:Master.init(master: master!),freeDay: freeDay)
        eventService.createEvent(event: event) { response in
            self.createResponse = response!
            self.showAlert.toggle()
            if self.createResponse.status == "success"{
                self.fetchEvents()
                self.creatingEvent.toggle()
            }
            
        }
        
    }
    func editEvent(id: Int,clientName: String,phoneNumber: String,instagram: String,price:String, date: Date,time: Date,duration: Date,masterId: Int,procedureId: Int,additionalInfo: String, freeDay: Bool) {
        let procedure = procedures.first(where: {$0.id == procedureId})
        let master = masters.first(where: {$0.id == masterId})
        let event = Event(id: id,clientName: clientName,phoneNumber:phoneNumber,instagram: instagram,price: price,date: date.toString(format:"dd.MM.yyyy"),time: time.toString(format:"HH:mm"),duration: duration.toString(format:"HH:mm"), master:Master.init(master: master!), procedure: Procedure.init(procedure: procedure!),additionalInfo: additionalInfo,freeDay: freeDay )
        eventService.editEvent(event: event) { response in
            
            self.createResponse = response!
            self.showAlert.toggle()
            if self.createResponse.status == "success" {
                self.fetchEvents()
                self.editingEvent.toggle()
            }
        }
    }
    
    func editEvent(id: Int, date: Date,masterId: Int, freeDay: Bool) {
        let master = masters.first(where: {$0.id == masterId})
        let event = Event(id: id,date: date.toString(format:"dd.MM.yyyy"), master:Master.init(master: master!),freeDay: freeDay )
        eventService.editEvent(event: event) { response in
            
            self.createResponse = response!
            self.showAlert.toggle()
            if self.createResponse.status == "success" {
                self.fetchEvents()
                self.editingEvent.toggle()
            }
        }
    }
    
    func fetchProcedures(){
        procedureService.getProcedures { procedures in
            if let procedures = procedures {
                self.procedureResponse = procedures
                if self.procedureResponse.status == "success"{
                    self.procedures = self.procedureResponse.procedures.map(Procedure.init)
                    self.loadingProcedures.toggle()
                }
            }
        }
    }
    
    func isDataLoaded() -> Bool {
        let result = true
        if self.loadingEvents == false || self.loadingProcedures == false || self.loadingMasters == false{
            return result == false
        }
        return result
    }
    func defineFrameSize(width:CGFloat) -> CGFloat {
        let result: CGFloat
        switch width {
        case 768.0...810.0:
            result = width/3
        case 1024.0...1080.0:
            result = width/4
        default:
            result = width/1.2
        }
        return result
    }
    
    
}


