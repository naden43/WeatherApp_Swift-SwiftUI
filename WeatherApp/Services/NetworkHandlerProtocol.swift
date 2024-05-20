//
//  NetworkHandlerProtocol.swift
//  WeatherApp
//
//  Created by Naden on 19/05/2024.
//

import Foundation

protocol NetworkHandlerProtocol {
    
    func loadData<T: Decodable>(url : String  , onCompletion: @escaping (T?, Error?) -> Void)

    
}
