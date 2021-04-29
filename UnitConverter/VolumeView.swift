//
//  VolumeView.swift
//  UnitConverter
//
//  Created by FARIT GATIATULLIN on 20.03.2021.
//

import SwiftUI



struct VolumeView: View {
    @State private var inputValue = ""
    @State private var inputScale = 0
    @State private var outputScale = 1
    let scales = ["Milliliters", "Liters", "Cups", "Pints", "Gallons"]
    
    
    var convertedValue: Double {
        let inputScaleSelection = scales[inputScale]
        let outputScaleSelection = scales[outputScale]
        var inputReadyToConvert: Measurement<UnitVolume>
        var outputValue: Double
        
        switch inputScaleSelection {
        case "Milliliters":
            inputReadyToConvert = Measurement(value: Double(inputValue) ?? 0, unit: UnitVolume.milliliters)
        case "Liters":
            inputReadyToConvert = Measurement(value: Double(inputValue) ?? 0, unit: UnitVolume.liters)
        case "Cups":
            inputReadyToConvert = Measurement(value: Double(inputValue) ?? 0, unit: UnitVolume.cups)
        case "Pints":
            inputReadyToConvert = Measurement(value: Double(inputValue) ?? 0, unit: UnitVolume.pints)
        case "Gallons":
            inputReadyToConvert = Measurement(value: Double(inputValue) ?? 0, unit: UnitVolume.gallons)
        default:
            inputReadyToConvert = Measurement(value: Double(inputValue) ?? 0, unit: UnitVolume.milliliters)
        }
        
        switch outputScaleSelection {
        case "Milliliters":
            outputValue = inputReadyToConvert.converted(to: UnitVolume.milliliters).value
        case "Liters":
            outputValue = inputReadyToConvert.converted(to: UnitVolume.liters).value
        case "Cups":
            outputValue = inputReadyToConvert.converted(to: UnitVolume.cups).value
        case "Pints":
            outputValue = inputReadyToConvert.converted(to: UnitVolume.pints).value
        case "Gallons":
            outputValue = inputReadyToConvert.converted(to: UnitVolume.gallons).value
        default:
            outputValue = inputReadyToConvert.converted(to: UnitVolume.milliliters).value
        }
        
        return outputValue


    }
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter volume", text: $inputValue)
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
                Section(header: Text("Converted volume")) {
                    Text("\(convertedValue, specifier: "%.4f") \(scales[outputScale])")
                        
                }
                        
                
            }
        }
    }
}

struct VolumeView_Previews: PreviewProvider {
    static var previews: some View {
        VolumeView()
    }
}
