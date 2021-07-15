//
//  ModelRegistration.swift
//  MotSpot
//
//  Created by Siarhei Dubko on 14.07.21.
//

import Foundation

struct User: Codable {
    var userName: String
    var email: String
    var pass: String
    var passAgain: String
    var countryId: Int
    var city: String
}
