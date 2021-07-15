//
//  NetworkManager.swift
//  MotSpot
//
//  Created by Siarhei Dubko on 14.07.21.
//

import SwiftUI

struct ServerMessage: Decodable {
    let email: String
    let pass: String
    let res: String
    let message: String
}

class HttpAuth: ObservableObject {

    @Published var authenticated = false

    func postAuth(email: String, pass: String) {
        guard let url = URL(string: "http://vm1588066.3ssd.had.wf:8080") else { return }

        let body: [String: String] = ["username": email, "password": pass]

        guard let finalBody = try? JSONEncoder().encode(body) else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = finalBody
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                print("response casting error!")
                return
            }
            
            if response.statusCode != 200 {
                print("response error, code: \(response.statusCode)")
                print("server message: ", String(data: data ?? Data(), encoding: .utf8) ?? "")
                return
            }
            
            guard let data = data else { return }
            
            do {
                
                let decoded = try JSONDecoder().decode(ServerMessage.self, from: data)
                if decoded.res.lowercased() == "correct" {
                    DispatchQueue.main.async {
                        self.authenticated = true
                    }
                }
                
            } catch let DecodingError.dataCorrupted(context) {
                print(#file, #line, #function, context)
            } catch let DecodingError.keyNotFound(key, context) {
                print(#file, #line, #function, "Key '\(key)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch let DecodingError.valueNotFound(value, context) {
                print(#file, #line, #function, "Value '\(value)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch let DecodingError.typeMismatch(type, context)  {
                print(#file, #line, #function, "Type '\(type)' mismatch:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch {
                print(#file, #line, #function, "error: ", error.localizedDescription)
            }
            
            
        }.resume()
    }
}
