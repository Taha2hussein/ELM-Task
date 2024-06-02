//
//  IncidentsModel.swift
//  Elm
//
//  Created by Taha Hussein on 02/06/2024.
//

import Foundation

struct IncidentsModel: Codable, Identifiable {
    var id: String?
    var incidents: [Incident]?
}

// MARK: - Incident
struct Incident: Codable,Identifiable {
    var id, description: String?
    var latitude, longitude: Double?
    var status: Int?
    var priority: Int?
    var typeID: Int?
    var issuerID: String?
    var assigneeID: String?
    var createdAt, updatedAt: String?
    var medias: [Media]?
}

// MARK: - Media
struct Media: Codable, Identifiable {
    var id, mimeType: String?
    var url: String?
    var type: Int?
    var incidentID: String?
}
