//
//  Player.swift
//  tv
//
//  Created by Christoph Walcher on 10.04.20.
//  Copyright © 2020 Christoph Walcher. All rights reserved.
//

import SwiftUI
import AVKit

struct PlayerWrapper: UIViewControllerRepresentable {
    var channel: Channel

    @Binding var navigationHidden: Bool
    @Binding var events: [EPGEvent]

    class Coordinator: NSObject, KxMovieViewControllerDelegate {
        var parent: PlayerWrapper

        init(_ parent: PlayerWrapper) {
            self.parent = parent
        }

        func newEPGEvent(_ event: EPGEvent) {
            parent.events.append(event)
            parent.events.sort { (a, b) -> Bool in
                return a.interval.start.compare(b.interval.start) == .orderedAscending
            }
        }
    }

    func makeCoordinator() -> PlayerWrapper.Coordinator {
        return Coordinator(self)
    }


    func makeUIViewController(context: Context) -> KxMovieViewController {
        let controller = KxMovieViewController.movieViewController(withContentPath: channel.proxyUrl.replacingOccurrences(of: " ", with: "%20"))! as! KxMovieViewController
        controller.delegate = context.coordinator
        controller.play()

        return controller
    }

    func updateUIViewController(_ controller: KxMovieViewController, context: Context) {
        controller.navigationController?.setNavigationBarHidden(navigationHidden, animated: false)
        UIApplication.shared.isStatusBarHidden = navigationHidden
    }
}


/*struct Player_Previews: PreviewProvider {
    static var previews: some View {
        Player()
    }
}*/
