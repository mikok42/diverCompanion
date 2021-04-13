//
//  DataParserError.swift
//  diverCompanion
//
//  Created by Mikołaj Linczewski on 11/04/2021.
//
import Foundation

enum DataParserError: Error {
    case wrongUrl
    case fourOThree
    var message: String {
        switch self {
        case .wrongUrl:
            return "wrong url"
        case .fourOThree:
            return "error 403"
        }
    }
}
