//
//  Message.swift
//  UI-383
//
//  Created by nyannyan0328 on 2021/12/06.
//

import SwiftUI
import LinkPresentation

struct Message: Identifiable {
    var id = UUID().uuidString
    var message : String
    var date : Date = Date()
    var url : URL?
    var linkMetaData : LPLinkMetadata?
    var previewIsLoading : Bool = false
    
}

