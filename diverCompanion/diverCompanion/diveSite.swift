//
//  diveSiteClass.swift
//  diverCompanion
//
//  Created by Mikołaj Linczewski on 09/04/2021.
//
import Foundation

struct DiveSite: Codable { //ogarnij
    let name: String
    let description: String
    let location: String
    let rating: Int
    let pictureName: String
    
    static func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        return nil
    }
    
    static func parse(jsonData: Data) -> [DiveSite] {
        do {
            let decodedData = try JSONDecoder().decode([DiveSite].self, from: jsonData)
            return decodedData
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
}
