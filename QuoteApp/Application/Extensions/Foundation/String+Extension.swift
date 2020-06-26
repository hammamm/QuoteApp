//
//  String+Extension.swift
//  SetupProject
//
//  Created by Hammam Abdulaziz on 26/06/2020.
//  Copyright © 2020 Hammam Abdulaziz - hammamo2010@gmail.com All rights reserved.
//

import Foundation

extension String {
                
    /// Supporting PrintHelper file
    ///
    /// - Author: Hammam Abdulaziz
    var logFilePath: String {
        let pathComponents = self.components(separatedBy: "/")
        let index = pathComponents.lastIndex(of: "SetupProject")
        return pathComponents.suffix(pathComponents.count - (index ?? 0)).joined(separator: " > ")
    }
}
