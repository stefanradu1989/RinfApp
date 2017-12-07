//
//  ListScreenViewModel.swift
//  RinfApp
//
//  Created by Radu Stefan on 07/12/2017.
//  Copyright © 2017 RS. All rights reserved.
//

import Foundation


class ListScreenViewModel {
    
    // list of places received trough network call
    var resultList: [Place]
    var onFinishedDownloadingData: (() -> ())?
    
    
    init() {
        resultList = []
    }
    
    
    // MARK: - Fetch Data
    
    func getData() {
        
        let completionHandler: ([Place]?, Error?) -> Void = { value, error in
            if let value = value {
                if value.count > 0 {
                    self.resultList = value
                    self.onFinishedDownloadingData?()
                }
            } else {
                print(error!.localizedDescription)
            }
        }
        
        NetworkManager.instance.getData(completionHandler: completionHandler)
    }
}
