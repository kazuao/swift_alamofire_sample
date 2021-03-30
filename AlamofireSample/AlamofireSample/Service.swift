//
//  Servicde.swift
//  AlamofireSample
//
//  Created by Kazunori Aoki on 2021/03/30.
//

import Foundation
import Alamofire

class Service {
    
    fileprivate var baseUrl = ""
    typealias countriesCallBack = (_ countries: [Country]?, _ status: Bool, _ message: String) ->Void
    
    var callBack: countriesCallBack?
    
    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    // MARK: -
    func getAllCountryNameFrom(endPoint: String) {
        AF.request(self.baseUrl + endPoint, method: .get).response { (response) in
            
            guard let data = response.data else {
                self.callBack?(nil, false, "")
                return
            }
            print(data)
            do {
                let countries = try JSONDecoder().decode([Country].self, from: data)
                self.callBack?(countries, true, "")
            } catch {
                self.callBack?(nil, false, error.localizedDescription)
            }
        }
    }
    
    func completionHandler(callBack: @escaping countriesCallBack) {
        self.callBack = callBack
    }
}
