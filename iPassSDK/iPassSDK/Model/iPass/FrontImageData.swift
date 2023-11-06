import Foundation

// MARK: - GETIDCardFrontModel
public struct FrontImageData: Codable {
    public let status: Bool?
    public let message: String?
    public let error: Error111?
    public let data : imageDataClass?
}
public struct imageDataClass: Codable {
    public let img: String
}
// MARK: - Error
public struct Error111: Codable {
    public let parseBody: ParseBody111?
    public let user : ParseUser?
}
public struct ParseUser: Codable {
    public let itle: String?
    public let status: Int?
    public let detail: String?
}
// MARK: - ParseBody
public struct ParseBody111: Codable {
    public let type, title: String?
    public let status: Int?
    public let detail: String?
}
