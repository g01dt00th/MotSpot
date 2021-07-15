//
//  NetworkManager.swift
//  MotSpot
//
//  Created by Siarhei Dubko on 14.07.21.
//

import Foundation
import SwiftUI
import Combine

struct ServerMessage: Decodable {
    public let email: String
    public let pass: String
    let res: String
    let message: String
}

class HttpAuth: ObservableObject {

    @Published var authenticated = false

    func postAuth(email: String, pass: String) {
        guard let url = URL(string: "http://vm1588066.3ssd.had.wf:8080") else { return }

        let body: [String: String] = ["username": email, "password": pass]

        let finalBody = try! JSONSerialization.data(withJSONObject: body)

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = finalBody
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            let resData = try! JSONDecoder().decode(ServerMessage.self, from: data)
            if resData.res == "correct" {
                DispatchQueue.main.async {
                    self.authenticated = true
                }
            }
        }.resume()
    }
}
