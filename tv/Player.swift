//
//  Player.swift
//  tv
//
//  Created by Christoph Walcher on 12.04.20.
//  Copyright © 2020 Christoph Walcher. All rights reserved.
//

import SwiftUI

struct Player: View {
    @State var barHide: Bool = false
    @State var timer = Timer.publish(every: 3, on: .current, in: .common)

    @State var sliderValue = 0.5

    var channel: Channel

    var body: some View {
        VStack {
            PlayerWrapper(channel: channel, hidden: $barHide)
        }
            .navigationBarTitle("")
            .navigationBarItems(trailing: ProgressBar(currentProgress: CGFloat(sliderValue)))
            .statusBar(hidden: true)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color.black)
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                self.timer.connect()
            }
            .onReceive(timer) { _ in
                self.barHide = true
                self.timer.connect().cancel()
            }
            .onTapGesture {
                if(self.barHide) {
                    self.barHide = false
                    self.timer = Timer.publish (every: 3, on: .current, in: .common)
                    self.timer.connect()
                } else {
                    self.barHide = true
                    self.timer.connect().cancel()
                }
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
