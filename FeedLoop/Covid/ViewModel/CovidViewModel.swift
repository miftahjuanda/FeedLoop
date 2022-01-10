//
//  CovidViewModel.swift
//  FeedLoop
//
//  Created by Miftah Juanda Batubara on 10/01/22.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire

class CovidViewModel {
    
    private var covidModelSubject = PublishSubject<[CovidModel]>()
    
    var covidModelObserve: Observable<[CovidModel]> {
        return covidModelSubject
    }
    
    func getDataCovid() {
        
        ApiManager.instance.callAPI(url: url_covid, method: .get, param: nil, encode: JSONEncoding.default, header: nil, completion: { [weak self]
            (covidModel: [CovidModel]?, errorModel: ErrorModel?, error) in
            
            if let error = error {
                print(error.localizedDescription)
            } else if let errorModel = errorModel {
                print(errorModel.message)
            } else {
                guard let dataCovid = covidModel else { return }
                
                let newData =  dataCovid.sorted(by: { $0.attributes.confirmed! < $1.attributes.confirmed! })
                
                self?.covidModelSubject.onNext(newData)
            }
            
        })
        
    }
    
}
