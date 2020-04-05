//
//  NSDate+WBExtension.swift
//  StartJourney
//
//  Created by 文波 on 2019/8/12.
//  Copyright © 2019 wenbo. All rights reserved.
//

import Foundation

public extension NSDate {
    var wb_calendar: NSCalendar {
        return NSCalendar(identifier: NSCalendar.Identifier.gregorian)!
    }
    
    func wb_after(value: Int, calendarUnit: NSCalendar.Unit) -> NSDate {
        return wb_calendar.date(bySettingUnit: calendarUnit, value: value, of: self as Date, options: NSCalendar.Options(rawValue: 0))! as NSDate
    }
    
    func wb_minus(date: NSDate) -> DateComponents {
        return wb_calendar.components(NSCalendar.Unit.minute, from: self as Date, to: date as Date, options: NSCalendar.Options(rawValue: 0))
    }
    
    var wb_year: Int {
        let calendar = NSCalendar.current
        let com = calendar.dateComponents([.year, .month, .day], from: self as Date)
        return com.year!
    }
    
    var wb_month: Int {
        let calendar = NSCalendar.current
        let com = calendar.dateComponents([.year, .month, .day], from: self as Date)
        return com.month!
    }
    
    var wb_day: Int {
        let calendar = NSCalendar.current
        let com = calendar.dateComponents([.year, .month, .day], from: self as Date)
        return com.day!
    }
    
    var wb_weekDay: Int {
        let timeInterval = Int(self.timeIntervalSince1970)
        let days = Int(timeInterval / 86400)
        let weekDay = ((days + 4)%7+7)%7
        return weekDay == 0 ? 7 : weekDay
    }
    
    func wb_daysInMonth() -> Int {
        let range = wb_calendar.range(of: NSCalendar.Unit.day, in: NSCalendar.Unit.month, for: self as Date)
        return range.length
    }
    
    // MARK:比较
    
    /// 是否是今天
    ///
    /// - Parameter date: 日期
    /// - Returns: true/false
    func wb_equalsTo(date: NSDate) -> Bool {
        return self.compare(date as Date) == ComparisonResult.orderedSame
    }
    
    func wb_greaterThan(date: NSDate) -> Bool {
        return self.compare(date as Date) == ComparisonResult.orderedDescending
    }
    
    /// 是否比今天小
    ///
    /// - Parameter date: 要比较日期
    /// - Returns: true/false
    func wb_lessThan(date: NSDate) -> Bool {
        return self.compare(date as Date) == ComparisonResult.orderedAscending
    }
    
    /// 是否是本月
    ///
    /// - Returns: true/false
    func wb_isThisMonth() -> Bool {
        let calendar = NSCalendar.current
        let com = calendar.dateComponents([.year,.month,.day], from: self as Date)
        let comNow = calendar.dateComponents([.year,.month,.day], from: Date())
        return com.year == comNow.year && com.month == comNow.month
    }
    
    // MARK:转换
    /// 将时间字符串转换成date
    ///
    /// - Parameters:
    ///   - dateString: 时间字符串
    ///   - format: 格式
    /// - Returns: date
    class func wb_parse(dateString: String, format: String = "yyyy-MM-dd HH:mm:ss") -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.date(from: dateString)!
    }
    
    /// 时间戳转日期
    ///
    /// - Parameter format: 时间格式
    /// - Returns: date string
    func wb_toString(format: String = "yyyy-MM-dd HH:mm:ss") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self as Date)
    }
}
