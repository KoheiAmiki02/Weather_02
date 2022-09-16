//
//  OneCall.swift
//  Weather_02
//
//  Created by cmStudent on 2022/01/17.
//


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let oneCall = try? newJSONDecoder().decode(OneCall.self, from: jsonData)

//
// To read values from URLs:
//
//   let task = URLSession.shared.oneCallTask(with: url) { oneCall, response, error in
//     if let oneCall = oneCall {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - OneCall
struct OneCall: Codable {
    let timezone: String
    let timezoneOffset: Int
    let current: Current
    let hourly: [Current]
    let daily: [Daily]

    enum CodingKeys: String, CodingKey {
        case timezone
        case timezoneOffset = "timezone_offset"
        case current, hourly, daily
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.currentTask(with: url) { current, response, error in
//     if let current = current {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Current
struct Current: Codable {
    let dt: Int
    let temp: Double
    let weather: [Weather]
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.weatherTask(with: url) { weather, response, error in
//     if let weather = weather {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Weather
struct Weather: Codable {
    let weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case weatherDescription = "description"
        case icon
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.dailyTask(with: url) { daily, response, error in
//     if let daily = daily {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Daily
struct Daily: Codable {
    let dt: Int
    let temp: Temp
    let weather: [Weather]
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.tempTask(with: url) { temp, response, error in
//     if let temp = temp {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Temp
struct Temp: Codable {
    let min, max: Double
}

// MARK: - URLSession response handlers
//
//extension URLSession {
//    fileprivate func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
//        return self.dataTask(with: url) { data, response, error in
//            guard let data = data, error == nil else {
//                completionHandler(nil, response, error)
//                return
//            }
//            completionHandler(try? newJSONDecoder().decode(T.self, from: data), response, nil)
//        }
//    }
//
//    func oneCallTask(with url: URL, completionHandler: @escaping (OneCall?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
//        return self.codableTask(with: url, completionHandler: completionHandler)
//    }
//}

