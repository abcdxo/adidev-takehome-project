//
//  ContentView.swift
//  Adidev-Countries
//
//  Created by Thinh Nguyen on 10/3/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var viewModel = CountryViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                if viewModel.isLoading {
                    ProgressView()
                } else if let error = viewModel.error {
                    ContentUnavailableView("Error", systemImage: "exclamationmark.triangle", description: Text(error.localizedDescription))
                } else {
                    ForEach(viewModel.countries) { country in
                        VStack(alignment: .leading) {
                            HStack {
                                Text(country.name + ",")
                                   
                                Text(country.region)
                                
                                Spacer()
                                
                                Text(country.code)
                            }
                            
                            Text(country.capital)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
            .navigationTitle("Countries")
            .task {
                await viewModel.fetchCountries()
            }
        }
    }}

#Preview {
    ContentView()
}
