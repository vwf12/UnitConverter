//
//  ContentView.swift
//  UnitConverter
//
//  Created by FARIT GATIATULLIN on 19.03.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var active: Bool = false
    @State private var tempActive: Bool = false
    @State private var volActive: Bool = false
    @State private var lengthActive: Bool = false
    @State private var timeActive: Bool = false
    
var body: some View {
    NavigationView() {
        VStack {
            Divider()
            NavigationLink(destination: TemperatureView()) {
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
                NavigationLink(destination: VolumeView()) {
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
                NavigationLink(destination: LengthView()) {
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
                NavigationLink(destination: TimeView()) {
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
