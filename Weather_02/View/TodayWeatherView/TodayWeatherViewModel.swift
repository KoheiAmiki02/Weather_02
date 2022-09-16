//
//  TodayWeatherViewModel.swift
//  Weather_02
//
//  Created by cmStudent on 2022/01/14.
//

import SwiftUI
import Combine
class TodayWeatherViewModel: ObservableObject {
    @Published var oneCall: OneCall?
    var cityName: String = "東京"
    var currentTemp: String = ""
    var currentWeatherDescription: String = ""
    var dailyTempMin: String = ""
    var dailyTempMax: String = ""
    var url = "https://api.openweathermap.org/data/2.5/onecall?lon=139.759&lat=35.6828&lang=ja&exclude=minutely,alerts&units=metric&appid=c3387b6d241313b8d686d2b77de02810"
    var cancellable = Set<AnyCancellable>()
    init() {
        let manager = GetOneCall()
        let publisher = manager.getOneCall(url: url)
        
        publisher?.sink(receiveCompletion: { _ in
            print("finished")
        }, receiveValue: { oneCall in
            self.oneCall = oneCall
            self.currentTemp = roundValue(value: self.oneCall!.current.temp)
            self.currentWeatherDescription = self.oneCall!.current.weather[0].weatherDescription
            self.dailyTempMin = roundValue(value: self.oneCall!.daily[0].temp.min)
            self.dailyTempMax = roundValue(value: self.oneCall!.daily[0].temp.max)
        })
        .store(in: &cancellable)
    }
}
