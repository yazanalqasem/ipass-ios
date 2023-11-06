//
//  UserDetailError.swift
//  DemoipAa
//
//  Created by Mobile on 01/03/23.
//

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
