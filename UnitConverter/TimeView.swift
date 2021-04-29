//
//  TimeView.swift
//  UnitConverter
//
//  Created by FARIT GATIATULLIN on 20.03.2021.
//

import SwiftUI

struct TimeView: View {
    init() {

        UISegmentedControl.appearance().setTitleTextAttributes([.font : UIFont.systemFont(ofSize: 10)], for: .normal)
    }
    
    
    @State private var inputValue = ""
    @State private var inputScale = 0
    @State private var outputScale = 1
    let scales = ["Seconds", "Minutes", "Hours", "Days", "Months", "Years"]

    var convertedValue: Double {
        let inputScaleSelection = scales[inputScale]
        let outputScaleSelection = scales[outputScale]
        var inputReadyToConvert: Measurement<UnitDuration>
        var outputValue: Double
        
        switch inputScaleSelection {
        case "Seconds":
            inputReadyToConvert = Measurement(value: Double(inputValue) ?? 0, unit: UnitDuration.seconds)
        case "Minutes":
            inputReadyToConvert = Measurement(value: Double(inputValue) ?? 0, unit: UnitDuration.seconds)
        case "Hours":
            inputReadyToConvert = Measurement(value: Double(inputValue) ?? 0, unit: UnitDuration.hours)
        case "Days":
            inputReadyToConvert = Measurement(value: (Double(inputValue) ?? 0) * 24 , unit: UnitDuration.hours)
        case "Months":
            inputReadyToConvert = Measurement(value: (Double(inputValue) ?? 0) * 730, unit: UnitDuration.hours)
        case "Years":
            inputReadyToConvert = Measurement(value: (Double(inputValue) ?? 0) * 8760, unit: UnitDuration.hours)
        default:
            inputReadyToConvert = Measurement(value: Double(inputValue) ?? 0, unit: UnitDuration.seconds)
        }
        
        switch outputScaleSelection {
        case "Seconds":
            outputValue = inputReadyToConvert.converted(to: UnitDuration.seconds).value
        case "Minutes":
            outputValue = inputReadyToConvert.converted(to: UnitDuration.minutes).value
        case "Hours":
            outputValue = inputReadyToConvert.converted(to: UnitDuration.hours).value
        case "Days":
            outputValue = inputReadyToConvert.converted(to: UnitDuration.hours).value / 24
        case "Months":
            outputValue = inputReadyToConvert.converted(to: UnitDuration.hours).value / 730
        case "Years":
            outputValue = inputReadyToConvert.converted(to: UnitDuration.hours).value / 8760
        default:
            outputValue = inputReadyToConvert.converted(to: UnitDuration.seconds).value
        }
        return outputValue
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter duration", text: $inputValue)
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
                Section(header: Text("Converted duration")) {
                    Text("\(convertedValue, specifier: "%.4f") \(scales[outputScale])")
                        
                }
                        
                
            }
        }
    }
}

struct TimeView_Previews: PreviewProvider {
    static var previews: some View {
        TimeView()
    }
}
