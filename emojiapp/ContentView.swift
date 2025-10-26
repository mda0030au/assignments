//
//  ContentView.swift
//  emojiapp
//
//  Created by matt on 10/25/25.
//
import SwiftUI

struct EmojiCounter: Identifiable {
    let id = UUID()
    let currentEmoji: String
    var emojiCount: Int
    var labelText: String = "hello"
}
struct ContentView: View {


    @State private var myCounters: [EmojiCounter] =
    [ EmojiCounter(currentEmoji: "❤️",emojiCount:0),
      EmojiCounter(currentEmoji: "🥶", emojiCount:0),
      EmojiCounter(currentEmoji: "🥳", emojiCount:0),
      EmojiCounter(currentEmoji: "😍", emojiCount:0),
      EmojiCounter(currentEmoji: "😀", emojiCount:0),
      EmojiCounter(currentEmoji: "🎃", emojiCount:0)
    ]
    
    @State private var labelText: String = "Hello"
    
    var body: some View {
        
        NavigationView {
              List {
                  
                  ForEach($myCounters) {$counter in
                      VStack(alignment: .leading) {
                      HStack {
                          Text(counter.currentEmoji)
                              .font(.largeTitle)
                          Text("Count: \(counter.emojiCount)")
                              .frame(minWidth:80, alignment: .leading)
                              .font(.headline)
                          
                          Spacer()
                          
                          Button{
                              
                              //var counter = myCounters[index]
                              counter.emojiCount += 1
                              counter.labelText = "\(counter.currentEmoji) counter = \(counter.currentEmoji)"
                          } label:
                          {
                              Image(systemName: "plus.circle")
                                  .font(.title3)
                          }
                          .buttonStyle(.borderless)
                          
                          Button {
                              //var counter = myCounters[index]
                              //if counter.emojiCount > 0
                                  counter.emojiCount -= 1
                                  counter.labelText = "\(counter.currentEmoji) counter = \(counter.currentEmoji)"
                          } label:
                          {
                              Image(systemName: "minus.circle")
                                  .font(.title3)
                          }
                          .buttonStyle(.borderless)
                      }
                      
                      Text(counter.labelText)
                          .font(.headline)
                          .padding(.vertical, 2)
                      
                  }
                  .padding(.vertical, 3)
                  }
                
            }
            .navigationTitle("Emoji App")
        }
    }
}
    
#Preview {
    ContentView( )
}
