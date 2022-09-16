//
//  HoursWeatherView.swift
//  Weather_02
//
//  Created by cmStudent on 2022/01/13.
//

import SwiftUI

struct HoursWeatherView: View {
    @ObservedObject var hoursWeatherViewModel = HoursWeatherViewModel()
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.gray)
                .opacity(0.3)
                .frame(width: 370, height: 150)
            VStack {
                Text("1時間ごとの天気予報")
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(0..<25) { i in
                            ZStack {
                                Capsule()
                                    .fill(Color.blue)
                                    .frame(width:80, height: 110)
                                VStack {
                                    Text("\(hoursWeatherViewModel.hour[i])時")
                                    Text(hoursWeatherViewModel.weatherDescription[i])
                                    Text("\(hoursWeatherViewModel.temp[i])°")
                                }
                            }
                        }
                    }
                }
                .frame(width: 370)
            }
        }
    }
}
