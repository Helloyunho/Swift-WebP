import Foundation

#if canImport(CoreGraphics)
import CoreGraphics

extension CGImage {
    public func getBaseAddress() throws -> UnsafeMutablePointer<UInt8> {
        guard let dataProvider = dataProvider,
            let data = dataProvider.data else {
            throw WebPError.unexpectedPointerError
        }
        // This downcast always succeeds
        let mutableData = data as! CFMutableData
        return CFDataGetMutableBytePtr(mutableData)
    }
}
#endif
