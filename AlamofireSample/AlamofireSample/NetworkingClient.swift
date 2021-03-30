////
////  NetworkingClient.swift
////  AlamofireSample
////
////  Created by Kazunori Aoki on 2021/03/30.
////
//
//import Foundation
//import Alamofire
//
//class NetworkingClient {
//    
//    typealias WebServiceResponse = ([[String: Any]]?, Error?) -> Void
//    
//    func execute(_ url: URL, completion: @escaping WebServiceResponse) {
//        
//        Alamofire.request(url).validate().responseJSON { response in
//            if let error = response.error {
//                completion(nil, error)
//            } else if let jsonArray = response.result.value as? [[String: Any]] {
//                completion(jsonArray, nil)
//            } else if let jsonDic = response.result.value as? [String: Any] {
//                completion([jsonDic], nil)
//            }
//        }
//    }
//}
