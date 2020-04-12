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
    
    @Binding var hidden: Bool

    func makeUIViewController(context: Context) -> KxMovieViewController {
        let controller = KxMovieViewController.movieViewController(withContentPath: channel.proxyUrl.replacingOccurrences(of: " ", with: "%20"), parameters: nil)! as! KxMovieViewController
        controller.play()
        
        return controller
    }

    func updateUIViewController(_ controller: KxMovieViewController, context: Context) {
        controller.navigationController?.setNavigationBarHidden(hidden, animated: true)
        UIApplication.shared.isStatusBarHidden = hidden
    }
}


/*struct Player_Previews: PreviewProvider {
    static var previews: some View {
        Player()
    }
}*/
