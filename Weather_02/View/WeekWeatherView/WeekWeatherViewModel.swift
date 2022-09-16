//
//  WeekWeatherViewModel.swift
//  Weather_02
//
//  Created by cmStudent on 2022/01/14.
//

import SwiftUI
import Combine
class WeekWeatherViewModel: ObservableObject {
    var unixChangerObject = UNIXChanger()
    @Published var oneCall: OneCall?
    var day: [String] = ["","","","","","","",""]
    var min: [String] = ["","","","","","","",""]
    var max: [String] = ["","","","","","","",""]
    var weatherDescription: [String] = ["","","","","","","",""]
    var url = "https://api.openweathermap.org/data/2.5/onecall?lon=139.759&lat=35.6828&lang=ja&exclude=minutely,alerts&units=metric&appid=c3387b6d241313b8d686d2b77de02810"
    var cancellable = Set<AnyCancellable>()
    init() {
        let manager = GetOneCall()
        let publisher = manager.getOneCall(url: url)
        
        publisher?.sink(receiveCompletion: { _ in
            print("finished")
        }, receiveValue: { oneCall in
            self.oneCall = oneCall
            for i in 0..<8 {
                self.day[i] = self.unixChangerObject.unixChanger(dt: self.oneCall!.daily[i].dt, template: 1)
                self.min[i] = roundValue(value: self.oneCall!.daily[i].temp.min)
                self.max[i] = roundValue(value: self.oneCall!.daily[i].temp.max)
                self.weatherDescription[i] = self.oneCall!.daily[i].weather[0].weatherDescription
            }
        })
        .store(in: &cancellable)
    }
}


