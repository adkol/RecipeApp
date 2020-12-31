//
//  RatingUpload.swift
//  SeniorResearch
//
//  Created by Adit Kolli on 12/6/20.
//  Copyright © 2020 Adit Kolli. All rights reserved.
//

import SwiftUI

final class RatingUpload:Codable {
    var Id:Int?
    var rating:Int
    init(rating: Int)
    {
        self.rating=rating
    }
}


