//
//  TodayWeatherView.swift
//  Weather_02
//
//  Created by cmStudent on 2022/01/13.
//

import SwiftUI

struct TodayWeatherView: View {
    @ObservedObject var todayWeatherViewModel = TodayWeatherViewModel()
    var body: some View {
        VStack {
            Text(todayWeatherViewModel.cityName)
                .font(.system(size: 50))
            Text("\(String(todayWeatherViewModel.currentTemp))°")
                .font(.system(size: 100))
            Text(todayWeatherViewModel.currentWeatherDescription)
                .font(.system(size: 30))
            HStack {
                Text("最高：\(String(todayWeatherViewModel.dailyTempMax))°")
                    .font(.system(size: 30))
                Text("最低：\(String(todayWeatherViewModel.dailyTempMin))°")
                    .font(.system(size: 30))
            }
        }
    }
}

struct TodayWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        TodayWeatherView()
    }
}
