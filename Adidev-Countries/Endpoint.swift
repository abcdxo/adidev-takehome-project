//
//  Endpoint.swift
//  Adidev-Countries
//
//  Created by Thinh Nguyen on 10/3/25.
//

import Foundation

protocol Endpoint {
    var url: URL { get }
}

enum JSONPlaceholderEndpoint {
    case countries
}

extension JSONPlaceholderEndpoint: Endpoint {
    var url: URL {
        switch self {
        case .countries:
            let baseURL = URL(string: "https://gist.githubusercontent.com/peymano-wmt/32dcb892b06648910ddd40406e37fdab/raw/db25946fd77c5873b0303b858e861ce724e0dcd0/countries.json")!
            return baseURL
        }
    }
}

