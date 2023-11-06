//  ErrorBase.swift
//  DemoipAa
//  Created by Mobile on 01/03/23.

import Foundation

public struct ErrorBase: Codable {
    public let user: ErrorData?
    public let jwtError : JWTError?
}

// MARK: - ErrorUser
public struct ErrorData: Codable {
    public let title: String?
    public let status: Int?
    public let detail: String?
}
public struct JWTError: Codable {
    public let bdy: Bdy?
}

// MARK: - Bdy
public struct JWTBdy: Codable {
    public let type, title, status, detail: String?
    public let instance: String?
}


