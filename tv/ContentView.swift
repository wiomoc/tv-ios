//
//  ContentView.swift
//  tv
//
//  Created by Christoph Walcher on 10.04.20.
//  Copyright © 2020 Christoph Walcher. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var channelsViewModel = ChannelsViewModel()
    @State private var filter: String = ""

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $filter)
                List(self.channelsViewModel.channels.filter({ self.filter.isEmpty || $0.name.localizedCaseInsensitiveContains(self.filter) }), id: \.proxyUrl) { channel in
                    NavigationLink(destination: Player(channel: channel)) {
                        ChannelRow(channel: channel)
                    }
                }.navigationBarTitle(Text("Channels"))
            }
        }
            .alert(
                isPresented: $channelsViewModel.error,
                content: { Alert(title: Text("Error")) }
            )
            .environment(\.horizontalSizeClass, .compact)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
