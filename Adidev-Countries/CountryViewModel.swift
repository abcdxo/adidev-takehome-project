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
            print(fetchedCountries)
            self.countries = fetchedCountries
        } catch let error {
            print(error.localizedDescription)
            self.error = error
        }
    }
}
