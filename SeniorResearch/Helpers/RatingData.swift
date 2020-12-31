//
//  RatingData.swift
//  SeniorResearch
//
//  Created by Adit Kolli on 12/9/20.
//  Copyright © 2020 Adit Kolli. All rights reserved.
//

struct RatingData: Codable {
    var results: [Rating]
}

struct Rating: Codable {
    var count:Int
}
