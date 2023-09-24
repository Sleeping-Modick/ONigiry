//
//  SearchData.swift
//  Pods
//
//  Created by 김기현 on 2023/09/23.
//

import Foundation


class Data{
    var main: String
    var detail:detailtype
    
    init(main: String, detail: detailtype) {
        self.main = main
        self.detail = detail
    }
}

enum detailtype:String {
    case A = "A"
    case B = "B"
}
