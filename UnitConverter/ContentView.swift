//
//  ContentView.swift
//  UnitConverter
//
//  Created by FARIT GATIATULLIN on 19.03.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var active: Bool = false
    
var body: some View {
    NavigationView() {
        VStack {
            Divider()
            NavigationLink(destination: TemperatureView(), isActive: $active) {
                Text("Temperature 🌡")
                    .font(.largeTitle)
                    .accentColor(.black)
                    .shadow(radius: 10)
                    .frame(minWidth: 0,
                                          maxWidth: .infinity,
                                          minHeight: 0,
                                          maxHeight: .infinity)
            }
            Divider()
                NavigationLink(destination: VolumeView(), isActive: $active) {
                    Text("Volume 🪣")
                        .font(.largeTitle)
                        .accentColor(.black)
                        .shadow(radius: 10)
                        .frame(minWidth: 0,
                                              maxWidth: .infinity,
                                              minHeight: 0,
                                              maxHeight: .infinity)
                    
                }
            Divider()
                NavigationLink(destination: LengthView(), isActive: $active) {
                    Text("Length 📏")
                        .font(.largeTitle)
                        .accentColor(.black)
                        .shadow(radius: 10)
                        .frame(minWidth: 0,
                                              maxWidth: .infinity,
                                              minHeight: 0,
                                              maxHeight: .infinity)
                }
            Divider()
                NavigationLink(destination: TimeView(), isActive: $active) {
                    Text("Time 🕰")
                        .font(.largeTitle)
                        .accentColor(.black)
                        .shadow(radius: 10)
                        .frame(minWidth: 0,
                                              maxWidth: .infinity,
                                              minHeight: 0,
                                              maxHeight: .infinity)
                }
            
        
      }
        
        .navigationBarTitle(!active ? "Converters" : "", displayMode: .inline)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
