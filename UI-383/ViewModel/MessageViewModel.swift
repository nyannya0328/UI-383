//
//  MessageViewModel.swift
//  UI-383
//
//  Created by nyannyan0328 on 2021/12/06.
//

import SwiftUI
import LinkPresentation

class MessageViewModel: ObservableObject {
    @Published var messageTF : String = ""
    
    @Published var messages : [Message] = []
    
    
    
    
    func sendMessage(){
        
        
        if !isMessageURL(){
            
            
            addToMessage()
            
            return
            
        }
        
        guard let url = URL(string: messageTF) else{return}
        
        
        let urlMessage = Message(message: messageTF,url: url, previewIsLoading: true)
        
        
        messages.append(urlMessage)
        
        
        let proVider = LPMetadataProvider()
        
        proVider.startFetchingMetadata(for: url) {[self] meta, err in
            
            
          
            DispatchQueue.main.async {
                
                if let _ = err{
                    
                    addToMessage()
                    return
                    
                }
                
                guard let meta = meta else{return}
                
                
                if let index = messages.firstIndex(where: { msg in
                    
                    
                    return urlMessage.id == msg.id
                })
                {
                    
                    messages[index].linkMetaData = meta
                    
                    
                }
        
            }
            
            
                    
        }
        
        
        
        
    }
    
    
    
    
    func isMessageURL()->Bool{
        
        if let url = URL(string: messageTF){
            
            return UIApplication.shared.canOpenURL(url)
            
        }
        
        return false
        
    }
    
    func addToMessage(){
        
        
        messages.append(Message(message: messageTF))
        messageTF = ""
        
    }
    
}
