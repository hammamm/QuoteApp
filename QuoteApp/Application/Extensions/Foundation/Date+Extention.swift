//
//  Date+Extention.swift
//  SetupProject
//
//  Created by Hammam Abdulaziz on 26/06/2020.
//  Copyright © 2020 Hammam Abdulaziz - hammamo2010@gmail.com All rights reserved.
//

import Foundation

extension Date {
    
    /// Calculating the time from a given date
    ///
    /// - Parameter date: date
    /// - Returns: time diff
    ///
    /// - Author: Hammam Abdulaziz
    func timeSince(_ date: Date) -> TimeInterval {
        let time = Date()
        return time.timeIntervalSince(date)
    }
            
    static func - (lhs: Date, rhs: Date) -> TimeInterval {
        return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }

}
