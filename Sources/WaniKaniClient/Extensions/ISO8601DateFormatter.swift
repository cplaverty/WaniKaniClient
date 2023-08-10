import Foundation

let waniKaniDateFormatter = ISO8601DateFormatter(formatOptions: [.withInternetDateTime, .withFractionalSeconds])

private extension ISO8601DateFormatter {
    convenience init(formatOptions: ISO8601DateFormatter.Options) {
        self.init()
        self.formatOptions = formatOptions
    }
}
