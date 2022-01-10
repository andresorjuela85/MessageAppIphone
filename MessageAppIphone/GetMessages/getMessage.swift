//
//  getMessage.swift
//  MessageAppIphone
//
//  Created by Camilo Orjuela on 27/12/21.
//  Copyright © 2021 Camilo Orjuela. All rights reserved.
//

import Foundation
import Alamofire

class GetMessage {
    
    func getList(completion: @escaping (webMessage?) -> Void) {
        AF.request("https://61d4cc528df81200178a8e47.mockapi.io/movies").responseDecodable(of: webMessage.self) { response in
            
            guard let moviesReceived = response.value else {
                completion(nil)
                return
            }
            
            completion(moviesReceived)
            
        }
    }
}

