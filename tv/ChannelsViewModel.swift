//
//  ChannelsViewModel.swift
//  tv
//
//  Created by Christoph Walcher on 10.04.20.
//  Copyright © 2020 Christoph Walcher. All rights reserved.
//

import Foundation
import Combine
import UIKit

class ChannelsViewModel: ObservableObject {
    @Published var channels = [Channel]()
    @Published var error = false
    private var cancellableSet = Set<AnyCancellable>()

    init() {
        URLSession.DataTaskPublisher(request: URLRequest(url: URL(string: "http://selfnet.tv/sap/channels.json")!),
                                     session: .shared)
            .tryMap { response -> Data in
                guard let httpResponse = response.response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                    throw APIError.unknown
                }
                return response.data
            }
            .decode(type: [Channel].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure( _):
                    self.error = true
                }
            }, receiveValue: { (channels) in
                self.channels = channels
            })
            .store(in: &cancellableSet)
    }
}
