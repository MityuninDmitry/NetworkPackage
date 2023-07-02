//
//  File 2.swift
//  
//
//  Created by Dmitry Mityunin on 7/2/23.
//

import Foundation

protocol AppNetworking {
    associatedtype T
    func makeRequest() async -> T?
}
