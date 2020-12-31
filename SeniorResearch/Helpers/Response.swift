//
//  Response.swift
//  SeniorResearch
//
//  Created by Adit Kolli on 10/27/20.
//  Copyright © 2020 Adit Kolli. All rights reserved.
//
struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var Title: String
    var time: Int
    var Yields: String
    var Ingredients: [String]
    var Instructions: String
    var Image: String
}

//struct Response: Codable {
//    var results: [Result]
//}
//
//struct Result: Codable {
//    var trackId: Int
//    var trackName: String
//    var collectionName: String
//}
