//  HandwrittenDocumentModel.swift
//  iPassSDK1
//  Created by CS on 18/04/23.

import Foundation

// MARK: - HandwrittenDocumentModel
public struct HandwrittenDocumentModel: Codable {
    public let status: Bool?
    public let message: String?
    public let data: HandwrittenDocumentDataClass?
    public let error: ErrorBase?
}

// MARK: - HandwrittenDocumentDataClass
public struct HandwrittenDocumentDataClass: Codable {
    public let parseBody: HandwrittenDocumentParseBody?
}

// MARK: - HandwrittenDocumentParseBody
public struct HandwrittenDocumentParseBody: Codable {
    public let error: HandwrittenDocumentError?
}

// MARK: - HandwrittenDocumentError
public struct HandwrittenDocumentError: Codable {
    public let code: Int?
    public let message, status: String?
}
