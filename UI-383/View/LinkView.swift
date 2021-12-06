//
//  LinkView.swift
//  UI-383
//
//  Created by nyannyan0328 on 2021/12/06.
//

import SwiftUI
import LinkPresentation

struct LinkView: UIViewRepresentable {
    
    var metaData : LPLinkMetadata
    func makeUIView(context: Context) -> LPLinkView {
        
        let view = LPLinkView(metadata: metaData)
        
        return view
        
    }
    
    func updateUIView(_ uiView: LPLinkView, context: Context) {
        
        uiView.metadata = metaData
    }
}

