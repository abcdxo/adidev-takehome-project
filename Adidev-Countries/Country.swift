//
//  Country.swift
//  Adidev-Countries
//
//  Created by Thinh Nguyen on 10/3/25.
//

import Foundation

struct Country: Codable, Identifiable {
    var id: String {
        return code
    }
    let capital: String
    let code: String
    let name: String
    let region: String
 
}


