//
//  QuoteView.swift
//  BBQuotes
//
//  Created by Muhammad on 14/04/26.
//

import SwiftUI

struct CharacterView: View {
    let character: Char
    let show: String
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .top) {
                Image(show.lowercased().replacingOccurrences(of: " ", with: ""))
                    .resizable()
                    .scaledToFit()
                
                ScrollView {
                    AsyncImage(url: character.images[0]) { image in
                        image
                            .resizable()
                            .scaledToFill()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: geo.size.width / 1.2, height: geo.size.height / 1.8)
                    .clipShape(.rect(cornerRadius: 25))
                    .padding(.top, 60)
                    
                    VStack(alignment: .leading) {
                        Text(character.name)
                            .font(.largeTitle)
                        
                        Text("Portrayed by: \(character.portrayedBy)")
                            .font(.title2)
                        
                        Divider()
                        
                        Text("\(character.name) Character Info")
                        
                        Text("Born: \(character.birthday)")
                        
                        Divider()
                        
                        Text("Occupations:")
                        
                        ForEach(character.occupations, id: \.self) { occupation in
                            Text("• \(occupation)")
                                .font(.subheadline)
                        }
                        
                        Divider()
                        
                        Text("Nicknames:")
                        
                        if character.aliases.count > 0 {
                            ForEach(character.aliases, id: \.self) { alias in
                                Text("• \(alias)")
                                    .font(.subheadline)
                            }
                        } else {
                            Text("None")
                                .font(.subheadline)
                        }
                        
                        Divider()
                    }
                    .frame(width: geo.size.width / 1.25, alignment: .leading)
                }
                .scrollIndicators(.hidden)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    CharacterView(character: ViewModel().character, show: "Breaking Bad")
}
