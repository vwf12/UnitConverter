//
//  TemperatureView.swift
//  UnitConverter
//
//  Created by FARIT GATIATULLIN on 20.03.2021.
//

import SwiftUI

struct TemperatureView: View {
    @State private var inputTemperature = ""
    @State private var inputScale = 0
    @State private var outputScale = 1
    let scales = ["Celcius", "Fahrenheit", "Kelvin"]
    
    
    var convertedTemperature: Double {
        let inputScaleSelection = scales[inputScale]
        let outputScaleSelection = scales[outputScale]
        
//        let inputToConvert: Measurement
        
        
        
        
         let inputInCelcius = Measurement(value: Double(inputTemperature) ?? 0, unit: UnitTemperature.celsius)
         let inputInFahrenheit = Measurement(value: Double(inputTemperature) ?? 0, unit: UnitTemperature.fahrenheit)
         let inputInKelvin = Measurement(value: Double(inputTemperature) ?? 0, unit: UnitTemperature.kelvin)
        
        var inputValue = inputInCelcius
        
        switch inputScaleSelection {
        case "Celcius":
            inputValue = inputInCelcius
        case "Fahrenheit":
            inputValue = inputInFahrenheit
        case "Kelvin":
            inputValue = inputInKelvin
        default:
            inputValue = inputInCelcius
        }
        
        var outputValue: Double
        
        switch outputScaleSelection {
        case "Celcius":
            outputValue = inputValue.converted(to: UnitTemperature.celsius).value
        case "Fahrenheit":
            outputValue = inputValue.converted(to: UnitTemperature.fahrenheit).value
        case "Kelvin":
            outputValue = inputValue.converted(to: UnitTemperature.kelvin).value
        default:
            outputValue = inputValue.converted(to: UnitTemperature.celsius).value
        }
        
        return outputValue
//        
//        let outputInCelcius = inputToConvert.converted(to: UnitTemperature.celsius).value
//// From here
//        switch inputScaleSelection {
//        case "Celcius":
//            switch outputScaleSelection {
//            case "Celcius":
//                return Double(inputTemperature) ?? 0
//            case "Fahrenheit":
//                let input = Measurement(value: Double(inputTemperature) ?? 0, unit: UnitTemperature.celsius)
//                return input.converted(to: UnitTemperature.fahrenheit).value
//            case "Kelvin":
//                let input = Measurement(value: Double(inputTemperature) ?? 0, unit: UnitTemperature.celsius)
//                return input.converted(to: UnitTemperature.kelvin).value
//            default:
//                return 0
//            }
//        case "Fahrenheit":
//            switch outputScaleSelection {
//            case "Celcius":
//                let input = Measurement(value: Double(inputTemperature) ?? 0, unit: UnitTemperature.fahrenheit)
//                return input.converted(to: UnitTemperature.celsius).value
//            case "Fahrenheit":
//                return Double(inputTemperature) ?? 0
//            case "Kelvin":
//                let input = Measurement(value: Double(inputTemperature) ?? 0, unit: UnitTemperature.fahrenheit)
//                return input.converted(to: UnitTemperature.kelvin).value
//            default:
//                return 0
//            }
//        case "Kelvin":
//            switch outputScaleSelection {
//            case "Celcius":
//                let input = Measurement(value: Double(inputTemperature) ?? 0, unit: UnitTemperature.kelvin)
//                return input.converted(to: UnitTemperature.celsius).value
//            case "Fahrenheit":
//                let input = Measurement(value: Double(inputTemperature) ?? 0, unit: UnitTemperature.kelvin)
//                return input.converted(to: UnitTemperature.fahrenheit).value
//            case "Kelvin":
//                return Double(inputTemperature) ?? 0
//            default:
//                return 0
//            }
//        default:
//            return 0
//        }
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter temperture", text: $inputTemperature)
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
                Section(header: Text("Converted temperature")) {
                    Text("°\(convertedTemperature, specifier: "%.2f")")
                        
                }
                        
                
            }
        }
    }


struct TemperatureView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureView()
    }
}
}
