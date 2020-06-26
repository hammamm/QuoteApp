//
//  services.swift
//
//  Created by hammam abdulaziz on 04/05/1441 AH.
//  Copyright © 1441 randomQuote. All rights reserved.
//

import Foundation

struct ModelError<T: Codable> : Codable {
    let status: Int?
    let base_url: String?
    let message: T
    let data: [String?]?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case base_url = "base_url"
        case message = "message"
        case data = "data"
    }
}

extension ModelError: Error, LocalizedError {
    
    /// Override `errorDescription`, from `LocalizedError` protocol to return the backend error.
    //    var errorDescription: String? {
    //        return message
    //    }
    
    func errorDescription(_ key: String? = nil) -> String {
        // cast the laravel error wich some time return a message of object no string
        if let key = key {
            if let object = message as? [String: Any], let errorMessage = object[key] as? [String]{
                return errorMessage.first ?? localizedDescription
            }else if let object = message as? [String: Any], let errorMessage = object[key] as? String{
                return errorMessage
            }else{
                return localizedDescription
            }
        }else{
            if let errorMessage = message as? String{
                return errorMessage
            }else{
                return localizedDescription
            }
        }
    }
}
