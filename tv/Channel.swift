//
//  Channel.swift
//  tv
//
//  Created by Christoph Walcher on 10.04.20.
//  Copyright © 2020 Christoph Walcher. All rights reserved.
//

import Foundation

struct Channel: Hashable, Codable {
    var name: String
    var proxyUrl: String
    var show: String
    var description: String

    private enum CodingKeys: String, CodingKey {
        case name, proxyUrl = "link-proxy", show, description
    }

    var showOrDescription: String {
        get {
            if !self.show.isEmpty {
                return self.show
            } else {
                return self.description
            }
        }
    }
}

enum APIError: Error, LocalizedError {
    case unknown, apiError(reason: String)

    var errorDescription: String? {
        switch self {
        case .unknown:
            return "Unknown error"
        case .apiError(let reason):
            return reason
        }
    }
}
