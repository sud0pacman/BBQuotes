//
//  FetchView.swift
//  BBQuotes
//
//  Created by Muhammad on 14/04/26.
//

import SwiftUI

struct FetchView: View {
    let vm = ViewModel()
    let show: String
    
    @State var showCharacterInfo: Bool = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image(show.removeCaseAndSpaces())
                    .resizable()
                    .frame(width: geo.size.width * 2.7, height: geo.size.height * 1.1)
                
                VStack {
                    Spacer(minLength: 60)
                    
                    switch vm.status {
                    case .notStarted:
                        EmptyView()
                    case .fetching:
                        ProgressView()
                    case .successQuote:
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
                        .onTapGesture {
                            showCharacterInfo.toggle()
                        }
                        
                        Spacer(minLength: 20)
                    case .successEpisode:
                        EpisodeView(episode: vm.episode)
                    case .failed(let error):
                        Text(error.localizedDescription)
                    }
                    
                    HStack {
                        Button("Get Random \nQuote") {
                            Task {
                                await vm.getQuoteData(for: show)
                            }
                        }
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding()
                        .background(Color("\(show.removeSpaces())Button"))
                        .clipShape(.rect(cornerRadius: 7))
                        .shadow(color: Color("\(show.removeSpaces())Shadow"), radius: 2)
                        
                        Spacer()
                        
                        Button("Get Random \nEpisode") {
                            Task {
                                await vm.getEpisodeData(for: show)
                            }
                        }
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding()
                        .background(Color("\(show.removeSpaces())Button"))
                        .clipShape(.rect(cornerRadius: 7))
                        .shadow(color: Color("\(show.removeSpaces())Shadow"), radius: 2)
                    }
                    .padding(.horizontal, 30)
                    
                    Spacer(minLength: 95)
                }
                .frame(width: geo.size.width, height: geo.size.height)
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .ignoresSafeArea()
        .toolbarBackgroundVisibility(.visible, for: .tabBar)
        .sheet(isPresented: $showCharacterInfo) {
            CharacterView(character: vm.character, show: show)
        }
    }
}

#Preview {
    FetchView(show: "Breaking Bad")
        .preferredColorScheme(.dark)
}
