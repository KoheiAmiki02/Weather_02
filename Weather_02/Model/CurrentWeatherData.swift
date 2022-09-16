//
//  CurrentWeatherData.swift
//  Weather_02
//
//  Created by cmStudent on 2022/01/17.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let currentWeatherData = try? newJSONDecoder().decode(CurrentWeatherData.self, from: jsonData)

//
// To read values from URLs:
//
//   let task = URLSession.shared.currentWeatherDataTask(with: url) { currentWeatherData, response, error in
//     if let currentWeatherData = currentWeatherData {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - CurrentWeatherData
/// 都市名からidを逆ジオするためのstruct
struct CurrentWeatherData: Codable {
    /// 緯度軽度のstruct
    let coord: Coord
    /// 都市名
    let name: String
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.coordTask(with: url) { coord, response, error in
//     if let coord = coord {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Coord
/// 緯度軽度のstruct
struct Coord: Codable {
    /// 経度
    let lon: Double
    /// 緯度
    let lat: Double
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
//    func currentWeatherDataTask(with url: URL, completionHandler: @escaping (CurrentWeatherData?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
//        return self.codableTask(with: url, completionHandler: completionHandler)
//    }
//}

