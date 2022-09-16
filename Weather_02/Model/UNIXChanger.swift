//
//  UNIXChanger.swift
//  Weather_02
//
//  Created by cmStudent on 2022/01/17.
//

import SwiftUI

class UNIXChanger: NSObject {
    
    func unixChanger(dt: Int, template: Int) -> (String){
        // UNIX時間 "dateUnix" をNSDate型 "date" に変換
        let dateUnix: TimeInterval = TimeInterval(dt)
        let date = NSDate(timeIntervalSince1970: dateUnix)

        // NSDate型を日時文字列に変換するためのNSDateFormatterを生成
        let formatter = DateFormatter()
        switch template {
        case 0:
            formatter.setTemplate(.onlyHour)
        case 1:
            formatter.setTemplate(.day)
        default:
            break
        }
        return formatter.string(from: date as Date)
    }
}

extension DateFormatter {
    // テンプレートの定義(例)
    enum Template: String {
        
        case date = "yMd"     // 2017/1/1
        case day = "d"
        case time = "Hms"     // 12:39:22
        case full = "yMdkHms" // 2017/1/1 12:39:22
        case onlyHour = "k"   // 17時
        case era = "GG"       // "西暦" (default) or "平成" (本体設定で和暦を指定している場合)
        case weekDay = "EEEE" // 日曜日
    }

    func setTemplate(_ template: Template) {
        // optionsは拡張用の引数だが使用されていないため常に0
        dateFormat = DateFormatter.dateFormat(fromTemplate: template.rawValue, options: 0, locale: .current)
    }
}
