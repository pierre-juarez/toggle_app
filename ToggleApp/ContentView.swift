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
  
    var body: some View {
      ZStack{
        backgroundColor.ignoresSafeArea(.all)
       
        VStack(alignment: .center){
          Spacer()
          Image(systemName: imageName)
            .font(.system(size: 80))
            .foregroundColor(imageColor)
          Spacer()
          Text(text)
            .font(.largeTitle)
            .bold()
          Toggle("", isOn: $lightsOn)
            .labelsHidden()
        }.foregroundColor(foregroundColor)
        
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
