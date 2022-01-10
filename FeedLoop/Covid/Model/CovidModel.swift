//
//  CovidModel.swift
//  FeedLoop
//
//  Created by Miftah Juanda Batubara on 10/01/22.
//

import Foundation

// MARK: - CovidModelElement

//struct CovidModel: Codable {
//    let attributes: [CovidData]
//}


struct CovidModel: Codable {
    let attributes: Attributes
}

// MARK: - Attributes
struct Attributes: Codable {
    let objectid: Int?
    let countryRegion: String?
    let lastUpdate: Int?
    let lat, long: Double?
    let confirmed, deaths: Int?
    let recovered, active: Int?

    enum CodingKeys: String, CodingKey {
        case objectid = "OBJECTID"
        case countryRegion = "Country_Region"
        case lastUpdate = "Last_Update"
        case lat = "Lat"
        case long = "Long_"
        case confirmed = "Confirmed"
        case deaths = "Deaths"
        case recovered = "Recovered"
        case active = "Active"
    }
}

var dataCovidDesc: [CovidModel] = []

