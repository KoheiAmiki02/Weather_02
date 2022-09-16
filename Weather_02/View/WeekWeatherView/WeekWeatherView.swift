//
//  WeekWeatherView.swift
//  Weather_02
//
//  Created by cmStudent on 2022/01/13.
//

import SwiftUI

struct WeekWeatherView: View {
    @ObservedObject var weekWeatherViewModel = WeekWeatherViewModel()
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.gray)
                .opacity(0.3)
                .frame(width: 370, height: 350)
            VStack {
                Text("8日間天気予報")
                ForEach(0..<8) { i in
                    ZStack {
                        Rectangle()
                            .frame(width: 350, height: 30)
                            .foregroundColor(.yellow)
                        HStack {
                            Text(weekWeatherViewModel.day[i])
                                .font(.system(size: 20))
                                .frame(maxWidth:70)
                            Text(weekWeatherViewModel.weatherDescription[i])
                                .font(.system(size: 20))
                                .frame(maxWidth:100)
                            Text(weekWeatherViewModel.min[i])
                                .font(.system(size: 20))
                                .frame(maxWidth:70)
                            Text(weekWeatherViewModel.max[i])
                                .font(.system(size: 20))
                                .frame(maxWidth:70)
                        }
                    }
                }
            }
        }
    }
}

struct WeekWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeekWeatherView()
    }
}
