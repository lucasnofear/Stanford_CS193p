//
//  ContentView.swift
//  Assignment1
//
//  Created by JULU SHI on 2022-04-06.
//

import SwiftUI

struct ContentView: View {
    
    let animals = ["🐶","🐱","🐹","🦊","🐻","🦁","🐸","🐣","🦄"]
    let sports = ["⚽️","🏀","🏈","🏓","🎱","🪁","🥏","🏏","🥊"]
    let cars = ["🚗","🚕","🚌","🚒","🚐","🚚","🦽","🚜"]
    
    @State private var currentTheme:Theme = .animals
    
    var currentEmojis: [String] {
        switch currentTheme {
        case .animals:
            return animals.shuffled()
        case .sports:
            return sports.shuffled()
        case .cars:
            return cars.shuffled()
        }
    }
    
    enum Theme {
        case animals, sports, cars
    }
    
    var body: some View {
        VStack {
            // title
            Text("Memorize!")
                .font(.largeTitle)
            
            // cards grid
            ScrollView {
                LazyVGrid(columns:[GridItem(.adaptive(minimum: 65))]) {
                    ForEach(currentEmojis, id:\.self) { emoji in
                        CardView(content: emoji)
                    }
                }
            }
            
            // theme selection
            HStack {
                Spacer()
                Button {
                    currentTheme = .animals
                } label: {
                    VStack {
                        Image(systemName: "pawprint").font(.largeTitle)
                        Text("Animals").font(.caption).fontWeight(.semibold)
                    }
                }
                Spacer()
                Button {
                    currentTheme = .sports
                } label: {
                    VStack {
                        Image(systemName: "bicycle").font(.largeTitle)
                        Text("Sports").font(.caption).fontWeight(.semibold)
                    }
                }
                Spacer()
                Button {
                    currentTheme = .cars
                } label: {
                    VStack {
                        Image(systemName: "car").font(.largeTitle)
                        Text("Vehicles").font(.caption).fontWeight(.semibold)
                    }
                }
                Spacer()
            }
        }.padding()
    }
}

struct CardView: View {
    @State private var isFaceUp = true
    
    var content: String
    
    var body: some View {
        
        ZStack {
            let cardShape = RoundedRectangle(cornerRadius: 15)
            if isFaceUp {
                cardShape.fill().foregroundColor(.white)
                cardShape.strokeBorder(lineWidth:3)
                Text(content).font(.largeTitle)
            } else {
                cardShape.fill().foregroundColor(.red)
            }
        }
        .aspectRatio(2/3, contentMode: .fill)
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
