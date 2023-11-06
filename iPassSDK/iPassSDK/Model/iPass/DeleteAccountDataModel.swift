//
//  DeleteAccountDataModel.swift
//  DemoipAa
//
//  Created by Mobile on 02/03/23.
//

import Foundation

// MARK: - DeleteAccountDataModel
public struct DeleteAccountDataModel: Codable {
    public let status: Bool?
    public let message: String?
    public let data: DeleteDataClass?
    public let error: ErrorBase?
}

// MARK: - DataClass
public struct DeleteDataClass: Codable {
}
