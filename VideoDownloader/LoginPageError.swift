//
//  LoginPageError.swift
//  VideoDownloader
//
//  Created by FS K on 14.02.2023.
//

import Foundation

enum LoginPageError : Error, LocalizedError {
    case noUserName
    case noPassword
    case wrongUsername
    case wrongPassword
    //case invalid
    
    public var errorDescription: String? {
        switch self {
            case .noUserName:
                return "There is no Username!"
            case .noPassword:
                return "There is no Password!"
            case .wrongUsername:
                return "Wrong Username!"
            case .wrongPassword:
                return "Wrong Password!"
            /*case .invalid:
                return "Username or password invalid!"*/
        }
    }
}


