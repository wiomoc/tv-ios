//
//  Player.swift
//  tv
//
//  Created by Christoph Walcher on 12.04.20.
//  Copyright © 2020 Christoph Walcher. All rights reserved.
//

import SwiftUI

struct Player: View {
    @State var navigationHidden: Bool = false
    @State var timer = Timer.publish(every: 3, on: .current, in: .common)

    @State var sliderValue = 0.5
    @State var events = [EPGEvent]()
    @State private var bottomSheetShown = false


    var channel: Channel

    var body: some View {
        ZStack {
            PlayerWrapper(channel: channel, navigationHidden: $navigationHidden, events: $events)
                .onTapGesture(count: 2) { /* XXX handled in KMovieViewController */ }
                .onTapGesture(count: 1) {
                    if(self.navigationHidden) {
                        self.navigationHidden = false
                        self.timer = Timer.publish (every: 3, on: .current, in: .common)
                        self.timer.connect()
                    } else {
                        self.navigationHidden = true
                        self.timer.connect().cancel()
                    }
            }
            BottomSheetView(isOpen: $bottomSheetShown, maxHeight: 600) {
                List(events.filter{$0.interval.end.compare(Date()) == .orderedDescending}, id: \.eventId) { event in
                    EPGEventRow(event)
                }
                .disabled(!bottomSheetShown)
            }
        }
            .navigationBarTitle("")
            .navigationBarItems(trailing: ProgressBar(currentProgress: CGFloat(sliderValue)))
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color.black)
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                self.timer.connect()
            }
            .onReceive(timer) { _ in
                self.navigationHidden = true
                self.timer.connect().cancel()
        }

    }
}
/*
struct Player_Previews: PreviewProvider {
    static var previews: some View {
        Player()
    }
}
*/
