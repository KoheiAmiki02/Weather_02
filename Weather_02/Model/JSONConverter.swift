//
//  JSONConverter.swift
//  Weather_02
//
//  Created by cmStudent on 2022/01/17.
//
import Foundation
// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

//struct JSONConverter {
//    let url: URL
//    init(urlString: String) {
//        url = URL(string: urlString)!
//    }
//
//    func resume(handler: @escaping (Data?, URLResponse?, Error?) -> ()) {
//        let request = URLRequest(url: url)
//        let task = URLSession.shared.dataTask(with: request, completionHandler: handler)
//        task.resume()
//
//
//    }
//
//
//}

