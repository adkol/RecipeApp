//
//  APIHelper.swift
//  SeniorResearch
//
//  Created by Adit Kolli on 12/6/20.
//  Copyright © 2020 Adit Kolli. All rights reserved.
//

import SwiftUI

enum APIError: Error{
    case ResponseProblem
    case decodingProblem
    case otherProblem
}


struct APIHelper{
    let resourceURL: URL
    init(endpoint:String)
    {
        let urlString="https://senior-research-akoll.sites.tjhsst.edu/ratings/" + endpoint
        guard let url=URL(string:urlString) else {fatalError()}
        self.resourceURL=url
    }
    
}


