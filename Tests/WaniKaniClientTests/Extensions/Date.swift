import XCTest
@testable import WaniKaniClient

extension Date {
    static func makeUTC(year: Int, month: Int, day: Int,
                        hour: Int = 0, minute: Int = 0, second: Int = 0, microsecond: Int = 0) -> Date {
        let string = String(format: "%4d-%02d-%02dT%02d:%02d:%02d.%06dZ",
                            year, month, day, hour, minute, second, microsecond)
        let date = waniKaniDateFormatter.date(from: string)!
        return date
    }
}
