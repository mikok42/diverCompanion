//
//  JsonParser.swift
//  diverCompanion
//
//  Created by Mikołaj Linczewski on 13/04/2021.
//

import Foundation

func readLocalFile(forName name: String) -> Data? {

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

 func parse<T: Codable>(jsonData: Data) -> T? {
    do {
        let decodedData = try JSONDecoder().decode(T.self, from: jsonData)
        return decodedData
    } catch {
        print(error.localizedDescription)
        return nil
    }
}
