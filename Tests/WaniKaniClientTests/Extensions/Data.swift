import Foundation

extension Data {
    init(reading stream: InputStream, bufferSize: Int = 1024) throws {
        self.init()
        
        let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: bufferSize)
        defer { buffer.deallocate() }
        
        stream.open()
        defer { stream.close() }
        
        while stream.hasBytesAvailable {
            let bytesRead = stream.read(buffer, maxLength: bufferSize)
            guard bytesRead > 0 else {
                if bytesRead == 0 {
                    break
                } else {
                    throw stream.streamError!
                }
            }
            
            append(buffer, count: bytesRead)
        }
    }
}
