//  DocumentErrorCase.swift

import Foundation

// MARK: - DocumentErrorCase
public struct DocumentErrorCase: Codable {
    public let status: Bool?
    public let message: String?
    public let data: DocumentErrorDataClass?
    public let error: ErrorBase?
}

// MARK: - DocumentErrorDataClass
public struct DocumentErrorDataClass: Codable {
    public let resParse: DocumentErrorResParse?
}

// MARK: - DocumentErrorResParse
public struct DocumentErrorResParse: Codable {
    public let detail: String?
}
