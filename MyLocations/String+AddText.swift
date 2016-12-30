//
//  String+AddText.swift
//  MyLocations
//
//  Created by Travis Cunningham on 12/29/16.
//  Copyright © 2016 Travis Cunningham. All rights reserved.
//

extension String {
    mutating func add(text: String?, separatedBy separator: String = "") {
        if let text = text {
            if !isEmpty {
                self += separator
            }
            self += text
        }
    }
}
