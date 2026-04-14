//
//  QuoteView.swift
//  BBQuotes
//
//  Created by Muhammad on 14/04/26.
//

import SwiftUI

struct QuoteView: View {
    let vm = ViewModel()
    let show: String
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image(show.lowercased().replacingOccurrences(of: " ", with: ""))
                    .resizable()
                    .frame(width: geo.size.width * 2.7, height: geo.size.height * 1.1)
                
                VStack {
                    Spacer(minLength: 60)
                    
                    Text("\"\(vm.quote.quote)\"")
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white)
                        .padding()
                        .background(.black.opacity(0.5))
                        .clipShape(.rect(cornerRadius: 25))
                        .padding()
                    
                    ZStack(alignment: .bottom) {
                        AsyncImage(url: vm.character.images[0]) { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: geo.size.width / 1.1, height: geo.size.height / 1.8)
                            
                        Text(vm.quote.character)
                            .foregroundStyle(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(.ultraThinMaterial)
                    }
                    .frame(width: geo.size.width / 1.1, height: geo.size.height / 1.8)
                    .clipShape(.rect(cornerRadius: 50))
                    
                    Spacer()
                    
                    Button("Get Random Quote") {
                        
                    }
                    .font(.title)
                    .foregroundStyle(.white)
                    .padding()
                    .background(.breakingBadGreen)
                    .clipShape(.buttonBorder)
                    .shadow(color: .breakingBarYellow, radius: 2)
                    
                    Spacer(minLength: 95)
                }
                .frame(width: geo.size.width, height: geo.size.height)
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    QuoteView(show: "Breaking bad")
        .preferredColorScheme(.dark)
}
