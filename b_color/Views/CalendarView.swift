//
//  CalendarView.swift
//  b_color_refactoring
//
//  Created by Dmitriy Nazarenko on 23.04.2020.
//  Copyright © 2020 Dmitriy Nazarenko. All rights reserved.
//

import SwiftUI

struct CalendarView: View {
    @Binding var date: Date
    var body: some View {
        
        DatePicker("", selection: self.$date, displayedComponents: .date)
            .labelsHidden()
            .datePickerStyle(WheelDatePickerStyle())
            .colorInvert()
        
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(date: .constant(Date()))
    }
}
