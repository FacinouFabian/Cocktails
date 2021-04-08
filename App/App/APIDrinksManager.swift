//
//  APIDrinksManager.swift
//  App
//
//  Created by Fabian on 02/04/2021.
//

import Foundation

class APIDrinksManager {
    
    static var shared = APIDrinksManager()
    
    private let baseURL = "https://www.thecocktaildb.com/api/json/v1/1"
    private let session = URLSession(configuration: .default)
    
    private func call<Data: Decodable>(_ path: String, completion: @escaping (Data?) -> Void) {
        guard let url = URL(string: "\(baseURL)/\(path)") else {
            completion(nil)
            return
        }
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let drinks = try decoder.decode(Data.self, from: data)
                    DispatchQueue.main.async { completion(drinks) }
                } catch (let error) {
                    print(error)
                    DispatchQueue.main.async { completion(nil) }
                    print("Deserialisation failed")
                }
            } else {
                DispatchQueue.main.async { completion(nil) }
                print("No data")
            }
        }

        task.resume()
    }
    
    func drinks(completion: @escaping (Drinks?) -> (Void)) {
        self.call("search.php?f=a", completion: completion)
    }
    
}
