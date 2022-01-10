//
//  ApiManager.swift
//  FeedLoop
//
//  Created by Miftah Juanda Batubara on 10/01/22.
//

import Foundation
import Alamofire

class ApiManager {
    private init(){}
    static let instance = ApiManager()
    
    
    func callAPI <T: Decodable, E: Decodable>(url: String, method: HTTPMethod, param: Parameters?, encode: ParameterEncoding, header: HTTPHeaders?, completion: @escaping (T?, E?, AFError?) -> ()) {
        
        AF.request(url, method: method, parameters: param, encoding: encode, headers: header)
            .validate(statusCode: 200...300)
            .responseJSON { (response) in
                switch response.result {
                case .success(_):
                    guard let data = response.data else { return }

                    do {
                        let jsonData = try JSONDecoder().decode(T.self, from: data )
                    
                        completion(jsonData, nil, nil)
//                        print(data, "dataa")
                    } catch let error {
                        print(error)
                    }
                    
                case .failure(let err):
                    guard let data = response.data else { return }
                    guard let statusCode = response.response?.statusCode else { return  }
                    
                    switch statusCode {
                    case 400..<500:
                        do {
                            let dataError = try JSONDecoder().decode(E.self, from: data)
                            completion(nil, dataError, nil)
                        } catch let error {
                            print(error)
                        }
                    default:
                        completion(nil, nil, err)
                    }
                }
            }
    }
}
