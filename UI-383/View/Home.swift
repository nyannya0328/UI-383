//
//  Home.swift
//  UI-383
//
//  Created by nyannyan0328 on 2021/12/06.
//

import SwiftUI

struct Home: View {
    @StateObject var model = MessageViewModel()
    var body: some View {
        NavigationView{
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack{
                    
                    
                    ForEach(model.messages){msg in
                        
                        
                        CardView(msg: msg)
                    }
                    
                    
                }
                
            }
            .navigationTitle("Link PreView")
            .safeAreaInset(edge: .bottom) {
                
                
                HStack{
                    
                    TextField("Enter Message", text: $model.messageTF)
                        .textFieldStyle(.roundedBorder)
                        .textCase(.lowercase)
                        .textInputAutocapitalization(.none)
                        .disableAutocorrection(true)
                        
                    
                    
                    Button {
                        model.sendMessage()
                    } label: {
                        
                        
                        Image(systemName: "paperplane.fill")
                            .font(.title3)
                    }

                    
                }
                
                .padding()
                .padding(.top)
                .background(.ultraThinMaterial)
                
            }
            
           
            
            
            
        }
        .preferredColorScheme(.dark)
    }
    
    @ViewBuilder
    func CardView(msg : Message)->some View{
        
        Group{
            
            if msg.previewIsLoading{
                
                
                if let metaData = msg.linkMetaData{
                    
                    LinkView(metaData: metaData)
                        .aspectRatio(contentMode:.fit)
                        .frame(width: getRect().width - 80, alignment: .trailing)
                      .frame(maxWidth: .infinity,alignment: .trailing)
                      
                }
                
                else{
                    
                    
                    Text(msg.url?.host ?? "")
                        .font(.title3)
                    
                    ProgressView()
                        .foregroundColor(.white)
                    
                
                }
                
            }
            
            else{
                
                Text(msg.message)
                    .font(.title3)
                    .foregroundColor(.white)
                    .padding(.vertical,10)
                    .padding(.horizontal)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .frame(width: getRect().width - 80, alignment: .trailing)
                  .frame(maxWidth: .infinity,alignment: .trailing)
                   
            }

        }
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

extension View{
    
    func getRect()->CGRect{
        
        return UIScreen.main.bounds
    }
}

