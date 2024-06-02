//
//  HomeViewModel.swift
//  Elm
//
//  Created by Taha Hussein on 02/06/2024.
//

import Foundation
class HomeViewModel: incidentsProtocols {
    @Published var searchText: String = ""
    @Published var incidents: [Incident] = []
    private let homeService: Service
  
    init(homeService: Service = DefaultHomeService()) {
        self.homeService = homeService
    }

    func fetchIncidents() {
        homeService.fetchIncidents { [weak self] incidentsModel in
            guard let self = self else { return }
            if let incidents = incidentsModel?.incidents {
                if self.searchText.isEmpty {
                    self.incidents = incidents
                } else {
                    self.incidents = incidents.filter { incident in
                        guard let createdAt = incident.createdAt else { return false }
                        return createdAt.localizedCaseInsensitiveContains(self.searchText)
                    }
                }
            } else {
                self.incidents = []
            }
        }
    }
}
