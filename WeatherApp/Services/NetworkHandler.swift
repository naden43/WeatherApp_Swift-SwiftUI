//
//  NetworkHandler.swift
//  WeatherApp
//
//  Created by Naden on 19/05/2024.
//

import Foundation
//import Alamofire

class NetworkHandler : NetworkHandlerProtocol {
    
           private let baseUrl = "https://api.weatherapi.com/v1/forecast.json?key=69998264af5f4e8eb0e83700241805"
    
           private let endOfUrl = "&days=3&aqi=no&alerts=no"
           //private let apiKey = "&APIkey=abc02ea64120a2a2b030bed665f226a1d66f109fa9f94eae9a6c66c8ca00d785"
           
           static let instance = NetworkHandler()
           
           private init(){}
           
          func loadData<T: Decodable>(url: String, onCompletion: @escaping (T?, Error?) -> Void) {
            print("Requesting data from: \(baseUrl)")
            
              
             let endUrl = "\(baseUrl)\(url)\(endOfUrl)"
              print(endUrl)
              let url = URL(string: endUrl)
              
              guard let url = url else {
                  print("this is a wrong url ")
                  return
              }
              
              let urlRequest = URLRequest(url: url)
              
              let session = URLSession(configuration: .default)
              
              let task = session.dataTask(with: urlRequest) { data , response, error in
                  
                  /*switch response.result {
                  case .success(let value):
                      print("Data received: \(value)")
                      onCompletion(value, nil)
                  case .failure(let error):
                      print("Error: \(error)")
                      onCompletion(nil, error)
                  }*/
                  
                  guard let data = data else {
                      guard let error = error else {
                          return
                      }
                      
                      onCompletion(nil , error)
                      return
                  }
                  
                  do {
                      
                      let result = try JSONDecoder().decode(T.self, from: data)
                      
                      onCompletion(result, nil)

                      
                  }catch let error {
                      
                      print(error)
                  }
                  
              }
              
              
              
            /*AF.request(baseUrl).responseDecodable(of: T.self) { response in
                
            }*/
              task.resume()
    }
}
