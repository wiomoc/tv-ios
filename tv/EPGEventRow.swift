//
//  EPGEventRow.swift
//  tv
//
//  Created by Christoph Walcher on 13.04.20.
//  Copyright © 2020 Christoph Walcher. All rights reserved.
//

import SwiftUI


struct EPGEventRow: View {
    var event: EPGEvent

    let dateFormatterHour = DateFormatter()
    let dateFormatterDay = DateFormatter()
    
    init(_ event: EPGEvent) {
        dateFormatterHour.dateFormat = "HH:mm"
        dateFormatterDay.dateFormat = "EEEE"
        self.event = event
    }

    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text(dateFormatterHour.string(from: event.interval.start))
                    .font(.system(size: 24))
                Text(dateFormatterDay.string(from: event.interval.start))
                    .font(.system(size: 13))
            }
            VStack(alignment: .leading) {
                Text(event.name)
                    .font(.system(size: 20))
                Text(event.longDescription)
            }
        }
    }
}

struct EPGEventRow_Previews: PreviewProvider {
    static var previews: some View {
        let event = EPGEvent()
        event.interval = DateInterval(start: Date.init(), duration: 1000)
        event.name = "Tagesschau"
        event.longDescription = "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet."
        return EPGEventRow(event).previewLayout(.fixed(width: 400, height: 500))
    }
}
