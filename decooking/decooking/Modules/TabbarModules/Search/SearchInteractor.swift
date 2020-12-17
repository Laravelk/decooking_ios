//
//  SearchInteractor.swift
//  decooking
//
//  Created by Иван Морозов on 17.12.2020.
//

import UIKit

protocol ISearchInteractor {
    
}

class SearchInteractor: ISearchInteractor {
    private var network: Network
    
    init() {
        self.network = Network()
    }
}
