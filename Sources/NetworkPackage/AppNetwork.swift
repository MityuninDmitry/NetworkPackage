//
//  File.swift
//  
//
//  Created by Dmitry Mityunin on 7/2/23.
//

import Foundation

//
//  AppNetworking.swift
//  JustQuotes
//
//  Created by Dmitry Mityunin on 7/2/23.
//

open class AppNetwork<T : Decodable>: AppNetworking {
    public let baseStringURL: String
    open func makeRequest() async -> T? {
        do {
            let (data, response) = try await URLSession.shared.data(from: URL(string: baseStringURL)!)
            
            let responseData = response as! HTTPURLResponse
            if responseData.statusCode != 200 {
                return nil
            }
            
            let quote =  try? JSONDecoder().decode(T.self, from: data)
            
            return quote
            
        } catch {
            
        }
        
        return nil
    }
    public init(url: String) {
        self.baseStringURL = url
    }
}
