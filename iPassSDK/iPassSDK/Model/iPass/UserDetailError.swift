//  UserDetailError.swift

import Foundation

// MARK: - UserDetailError
public struct UserDetailGetImageModel: Codable {
    public let status: Bool?
    public let message: String?
    public let error: ErrorBase?
}
public struct userFaceDataClass: Codable {
    public let img: String
}
