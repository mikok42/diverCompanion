//
//  JsonParser.swift
//  diverCompanion
//
//  Created by Mikołaj Linczewski on 13/04/2021.
//

import Foundation

class JSONParser{
    static let sharedParser = JSONParser()
    private init(){}
    
    func readLocalFile(forName name: String) -> Data? {
        do {
            guard let bundlePath = Bundle.main.path(forResource: name, ofType: "json") else {throw DataParserError.fileDoesNotExist }
            guard let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) else { throw DataParserError.unableToDecode }
            return jsonData
        } catch {
            print(error)
            return nil
        }
    }
//    func readFromURL(fromURL: String) -> Data? {
//        var jsonData: Data
//        guard let url = URL(string: fromURL) else { return nil }
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard let jsonData = data else { return }
//        }.resume()
//        return jsonData
//    }    
     func parse<T: Codable>(jsonData: Data) -> T? {
        do {
            let decodedData = try JSONDecoder().decode(T.self, from: jsonData)// else { throw DataParserError.unableToDecode }
            return decodedData
        } catch {
            print(error)
            return nil
        }
    }
}
