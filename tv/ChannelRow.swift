//
//  ChannelRow.swift
//  tv
//
//  Created by Christoph Walcher on 10.04.20.
//  Copyright © 2020 Christoph Walcher. All rights reserved.
//

import SwiftUI

struct ChannelRow: View {
    var channel: Channel
    var body: some View {
        VStack(alignment: .leading) {
            Text(channel.name)
            Text(channel.showOrDescription)
                .font(.system(size: 14))
                .truncationMode(.tail)
                .lineLimit(1)
        }
    }
}

struct ChannelRow_Previews: PreviewProvider {
    static var previews: some View {
        ChannelRow(channel: Channel(name: "Das Erste HD", proxyUrl: "http://...", show: "Tagesschau", description: ""))
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
