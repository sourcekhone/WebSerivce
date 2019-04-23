//
//  Profile.swift
//  WebService
//
//  Created by Mahdi Mahjoobi on 4/24/19.
//  Copyright © 2019 Mahdi Mahjoobi. All rights reserved.
//

import Foundation

struct Profile: Codable {
    let name, lastName: String
    let info: Info
}

struct Info: Codable {
    let position: String
    let age: Int
}
