import XCTest
@testable import WaniKaniClient

extension XCTestCase {
    func makeUTCDate(year: Int, month: Int, day: Int,
                     hour: Int? = nil, minute: Int? = nil, second: Int? = nil, microsecond: Int? = nil) -> Date {
        let string = String(format: "%4d-%02d-%02dT%02d:%02d:%02d.%06dZ",
                            year, month, day, hour ?? 0, minute ?? 0, second ?? 0, microsecond ?? 0)
        let date = DateFormatter.iso8601.date(from: string)!
        return date
    }
}
