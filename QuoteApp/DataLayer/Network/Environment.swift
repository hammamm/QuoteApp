//
//  Environment.swift
//  SetupProject
//
//  Created by Hammam Abdulaziz on 26/06/2020.
//  Copyright © 2020 Hammam Abdulaziz - hammamo2010@gmail.com All rights reserved.
//

import Foundation

enum Environment {
    
    case production
    case development
    
    static var baseURL: String {
        return Environment.current == production ? production.url : development.url
    }
    
    static var current: Environment {
        #if DEBUG
        return .development
        #else
        return .production
        #endif
    }
    
    private var url: String {
        switch self {
        case .production:
            return "https://programming-quotes-api.herokuapp.com"
        case .development:
            return "https://programming-quotes-api.herokuapp.com"
        }
    }
}
