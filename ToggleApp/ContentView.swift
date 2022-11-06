//
//  ContentView.swift
//  ToggleApp
//
//  Created by Tech Fitco on 5/11/22.
//

import SwiftUI

struct ContentView: View {
  
  @AppStorage("lightsOn") private var lightsOn: Bool = false
  
  private var backgroundColor: Color {
    lightsOn ? .white : .black
  }
  
  private var foregroundColor: Color {
    lightsOn ? .black : .white
  }
  
  private var imageName: String {
    lightsOn ? "sun.max.fill" : "moon.fill"
  }
  
  private var imageColor: Color {
    lightsOn ? .yellow : .blue
  }
  
  private var text: String {
    lightsOn ? "¡Apaga la luz!" : "¡Prende la luz!"
  }
  
  @State private var rotation: Double = 0
  
    var body: some View {
      ZStack{
        backgroundColor.ignoresSafeArea(.all)
       
        VStack(alignment: .center){
          Spacer()
          Image(systemName: imageName)
            .font(.system(size: 80))
            .foregroundColor(imageColor)
            .padding()
            .rotationEffect(.degrees(rotation))
            .animation(Animation.easeInOut(duration: 1), value: rotation)
          Spacer()
          Text(text)
            .font(.largeTitle)
            .bold()
            .animation(.none)
          Toggle("", isOn: $lightsOn.animation())
            .labelsHidden()
        }.foregroundColor(foregroundColor)
          .onChange(of: lightsOn) { value in
            if value {
              rotation += 360
            }else{
              rotation -= 360
            }
          }
        
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
