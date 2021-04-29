//
//  LengthView.swift
//  UnitConverter
//
//  Created by FARIT GATIATULLIN on 20.03.2021.
//

import SwiftUI

struct LengthView: View {
//    init() {
//
//        UISegmentedControl.appearance().setTitleTextAttributes([.font : UIFont.systemFont(ofSize: 12)], for: .normal)
//
//    }
    
    
    @State private var inputValue = ""
    @State private var inputScale = 0
    @State private var outputScale = 1
    let scales = ["Meters", "Kilometers", "Feet", "Yards", "Miles"]
    
    
    var convertedValue: Double {
        let inputScaleSelection = scales[inputScale]
        let outputScaleSelection = scales[outputScale]
        var inputReadyToConvert: Measurement<UnitLength>
        var outputValue: Double
        
        switch inputScaleSelection {
        case "Meters":
            inputReadyToConvert = Measurement(value: Double(inputValue) ?? 0, unit: UnitLength.meters)
        case "Kilometers":
            inputReadyToConvert = Measurement(value: Double(inputValue) ?? 0, unit: UnitLength.kilometers)
        case "Feet":
            inputReadyToConvert = Measurement(value: Double(inputValue) ?? 0, unit: UnitLength.feet)
        case "Yards":
            inputReadyToConvert = Measurement(value: Double(inputValue) ?? 0, unit: UnitLength.yards)
        case "Miles":
            inputReadyToConvert = Measurement(value: Double(inputValue) ?? 0, unit: UnitLength.miles)
        default:
            inputReadyToConvert = Measurement(value: Double(inputValue) ?? 0, unit: UnitLength.meters)
        }
        
        switch outputScaleSelection {
        case "Meters":
            outputValue = inputReadyToConvert.converted(to: UnitLength.meters).value
        case "Kilometers":
            outputValue = inputReadyToConvert.converted(to: UnitLength.kilometers).value
        case "Feet":
            outputValue = inputReadyToConvert.converted(to: UnitLength.feet).value
        case "Yards":
            outputValue = inputReadyToConvert.converted(to: UnitLength.yards).value
        case "Miles":
            outputValue = inputReadyToConvert.converted(to: UnitLength.miles).value
        default:
            outputValue = inputReadyToConvert.converted(to: UnitLength.meters).value
        }
        return outputValue
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter length", text: $inputValue)
                        .keyboardType(.decimalPad)
                }
                Section(header: Text("Select input scale")) {
                    Picker("Scales", selection: $inputScale) {
                        ForEach(0..<scales.count) {
                            Text("\(self.scales[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                    Section(header: Text("Select output scale")) {
                        Picker("Scales", selection: $outputScale) {
                            ForEach(0..<scales.count) {
                                Text("\(self.scales[$0])")
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        
                }
                Image(systemName: "arrow.down")
                    .font(.system(size: 26.0))
                    .frame(maxWidth: .infinity, alignment: .center)
                Section(header: Text("Converted length")) {
                    Text("\(convertedValue, specifier: "%.4f") \(scales[outputScale])")
                        
                }
                        
                
            }
        }
    }
}

struct LengthView_Previews: PreviewProvider {
    static var previews: some View {
        LengthView()
    }
}
