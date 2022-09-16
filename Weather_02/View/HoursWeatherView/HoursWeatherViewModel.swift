//
//  HoursWeatherViewModel.swift
//  Weather_02
//
//  Created by cmStudent on 2022/01/14.
//

import SwiftUI
import Combine
class HoursWeatherViewModel: ObservableObject {
    var unixChangerObject = UNIXChanger()
    @Published var oneCall: OneCall?
    var hour: [String] = ["","","","","","","","","","","","","","","","","","","","","","","","","",""]
    var temp: [String] = ["","","","","","","","","","","","","","","","","","","","","","","","","",""]
    var weatherDescription: [String] = ["","","","","","","","","","","","","","","","","","","","","","","","","",""]
    var url = "https://api.openweathermap.org/data/2.5/onecall?lon=139.759&lat=35.6828&lang=ja&exclude=minutely,alerts&units=metric&appid=c3387b6d241313b8d686d2b77de02810"
    var cancellable = Set<AnyCancellable>()
    init() {
        let manager = GetOneCall()
        let publisher = manager.getOneCall(url: url)
        
        publisher?.sink(receiveCompletion: { _ in
            print("finished")
        }, receiveValue: { oneCall in
            self.oneCall = oneCall
            for i in 0..<25 {
                self.hour[i] = self.unixChangerObject.unixChanger(dt: self.oneCall!.hourly[i].dt, template: 0)
                self.temp[i] = roundValue(value: self.oneCall!.hourly[i].temp)
                self.weatherDescription[i] = self.oneCall!.hourly[i].weather[0].weatherDescription
            }
        })
        .store(in: &cancellable)
    }
}


