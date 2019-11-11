//
//  RepositoryDetailViewModel.swift
//  b_color
//
//  Created by Dmitriy Nazarenko on 07.11.2019.
//  Copyright © 2019 Dmitriy Nazarenko. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

final class MasterDetailViewModel: ObservableObject {
    let objectWillChange: AnyPublisher<MasterListViewModel, Never>
    let objectWillChangeSubject = PassthroughSubject<MasterListViewModel, Never>()
    
    let master: Master
    
    init(master: Master) {
        objectWillChange = objectWillChangeSubject.eraseToAnyPublisher()
        self.master = master
    }
}
