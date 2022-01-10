//
//  File.swift
//  MessageAppIphone
//
//  Created by Camilo Orjuela on 27/12/21.
//  Copyright © 2021 Camilo Orjuela. All rights reserved.
//

import Foundation

struct webMessage: Decodable {
    let movies: [OneMovie]
}

struct OneMovie: Decodable {
    let title: String
    let episode_id: Int
    let opening_crawl: String?
    let director: String?
    let producer: String?
    let release_date: String?
    var leido: Bool?
}
