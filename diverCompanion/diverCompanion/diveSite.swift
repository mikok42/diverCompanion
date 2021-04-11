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
    
    static func getData() -> [DiveSite] {
        let description1 = """
        The Salem Express was a former 115m long passenger ferry which sank in 1991 at great human cost just south of Safaga. The immense tragedy of this event makes diving the Salem Express a unique experience that leaves a lasting impression on most scuba divers. She rests on her starboard side on a flat sand bottom at 27m of depth, with the shallowest section at just 7m.
        """
        let description2 = """
        Daedalus Reef (also known as Abu Kizan) is a 400-meter-long and 100-meter-wide (1,310–330 ft) standalone reef in the Egyptian Red Sea situated about 90 kilometers from Marsa Alam. There is a small artificial island in the center of the reef, which hosts a lighthouse constructed in 1863 and rebuilt in 1931. Daedalus reef is a well-known place for diving because of good chances to see pelagic fish, such as hammerhead sharks, and an abundance of corals. In the high season one can find many dive safari boats staying overnight, anchored to the reef.
        """
        return [
            DiveSite(name: "Daedalus Reef", description: description2, location: "Red Sea, Egypt", rating: 5, pictureName: "daedalusReef"),
            DiveSite(name: "Salem Wreck", description: description1, location: "Red Sea, Egypt", rating: 4, pictureName: "salemWreck")
        ]
    }
}
