//
//  CryptoViewModel.swift
//  CryptoCrazyRxswiftMVVM
//
//  Created by Mustafa Kemal Özen on 22.08.2023.
//

import Foundation
import RxCocoa
import RxSwift

class CryptoViewModel {
    
    
    public let cryptos : PublishSubject<[Crypto]> = PublishSubject()
    public let loading: PublishSubject<Bool> = PublishSubject()
    public let error : PublishSubject<String> = PublishSubject()
    
    
    public func requestData(){
        
        self.loading.onNext(true)
        
        Webservice().downloadCrurrencies(url: URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!) { cryptoResult in
            self.loading.onNext(false)
            switch cryptoResult {
            case .success(let cryptos):
                print(cryptos)
                self.cryptos.onNext(cryptos)
            case .failure(let failure):
                switch failure {
                case .parsingError:
                    self.error.onNext("Cannot parse your data")
                case .serverError:
                    self.error.onNext("Cannot get your data at all")
                }
            }
        }
        
        
    }
}
