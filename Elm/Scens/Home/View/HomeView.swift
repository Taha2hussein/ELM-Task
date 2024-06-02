//
//  HomeView.swift
//  Elm
//
//  Created by Taha Hussein on 02/06/2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel: HomeViewModel = HomeViewModel()
    @StateObject var router: Router<ViewsRoute>
    
    init(router: Router<ViewsRoute>) {
        _router = StateObject(wrappedValue: router)
    }
    var body: some View {
        VStack {
            TextField("Search", text: $viewModel.searchText)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Search") {
                viewModel.searchText = viewModel.searchText.trimmingCharacters(in: .whitespacesAndNewlines)
                viewModel.fetchIncidents()
            }
            .padding()
            
            List($viewModel.incidents, id: \.id) { $incident in
                IncidentCell(incident: $incident)
            }
            

        }
        .onAppear {
            viewModel.fetchIncidents()
        }
    }
}


struct IncidentCell: View {
    @Binding var incident: Incident

    var body: some View {
        HStack {
            Text(incident.createdAt ?? "")
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
        }
        .padding(.vertical, 5)
    }
}
