//
//  WeatherView.swift
//  Weather_02
//
//  Created by cmStudent on 2022/01/13.
//

import SwiftUI

struct WeatherView: View {
    var body: some View {
        VStack {
            ScrollView {
                TodayWeatherView()
                Spacer()
                HoursWeatherView()
                Spacer()
                Spacer()
                WeekWeatherView()
            }
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
