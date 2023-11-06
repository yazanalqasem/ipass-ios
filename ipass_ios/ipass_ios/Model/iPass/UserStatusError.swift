//  UserStatusError.swift

import Foundation

// MARK: - UserStatusError
public struct UserStatusError: Codable {
    public let uerror: UserError?
}

// MARK: - Error
public struct UserError: Codable {
    public let ustatusParse: UserStatusParse?
}

// MARK: - StatusParse
public struct UserStatusParse: Codable {
    public let type, title: String?
    public let status: Int?
    public let detail: String?
}
