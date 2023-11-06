//
//  JWTToken.swift
//  DemoipAa
//
//  Created by Mobile on 28/02/23.
//

import Foundation
// MARK: - JWTToken
public struct JWTToken: Codable {
    public let status: Bool?
    public let message: String?
    public let data: DataClass?
    public let error: ErrorBase?
}

// MARK: - DataClass
public struct DataClass: Codable {
    public let user: User?
}

// MARK: - User
public struct User: Codable {
    public let firstName, lastName, email, password: String?
    public let id: String?
    public let v: Int?
    public let token: String?
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case email, password
        case id = "_id"
        case v = "__v"
        case token
    }
}

