//
//  CountryViewModel.swift
//  Adidev-Countries
//
//  Created by Thinh Nguyen on 10/3/25.
//

import Foundation

@Observable
final class CountryViewModel {
    var countries: [Country] = []
    var isLoading = false
    var error: Error?

    func fetchCountries() async {
        isLoading = true
        defer { isLoading = false }
        
        do {
            let fetchedCountries: [Country] = try await NetworkManager.shared.fetch(from: JSONPlaceholderEndpoint.countries.url)
            self.countries = fetchedCountries
        } catch let error {
            self.error = error
        }
    }
}
