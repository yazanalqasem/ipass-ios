// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let sMPhoneModel = try? JSONDecoder().decode(SMPhoneModel.self, from: jsonData)

import Foundation

// MARK: - SMPhoneModel
public struct SMPhoneModel: Codable {
    public let status: Bool?
    public let message: String?
    public let data: SMPhoneData?
    public let error: SMPhoneError?
}

// MARK: - Error
public struct SMPhoneError: Codable {
    public let bdy: SMPhoneBdy?
    public let user: UserStatusParse?
}

// MARK: - Bdy
public struct SMPhoneBdy: Codable {
    public let type, title, status, detail: String?
    public let instance: String?
}

// MARK: - SMPhoneModelData
public struct SMPhoneData: Codable {
    public let resParse: SMResParse?
}

// MARK: - ResParse
public struct SMResParse: Codable {
    public let success: Bool?
    public let error: Error?
    public let data: ResParseData?
}

// MARK: - ResParseData
public struct ResParseData: Codable {
    public let number: Int?
    public let valid, disposable: Bool?
    public let type, country, carrier: String?
    public let score: Int?
    public let accountDetails: AccountDetails?
    public let appliedRules: [AppliedRule]?

    enum CodingKeys: String, CodingKey {
        case number, valid, disposable, type, country, carrier, score
        case accountDetails = "account_details"
        case appliedRules = "applied_rules"
    }
}

// MARK: - AccountDetails
public struct AccountDetails: Codable {
    public let facebook: Bukalapak?
    public let google: Google?
    public let twitter, instagram, yahoo, microsoft: Bukalapak?
    public let snapchat: Bukalapak?
    public let skype: Skype?
    public let whatsapp, telegram, viber: Telegram?
    public let kakao: Bukalapak?
    public let ok: Ok?
    public let zalo: Zalo?
    public let line: Line?
    public let flipkart, bukalapak, jdid: Bukalapak?
}

// MARK: - Bukalapak
public struct Bukalapak: Codable {
    public let registered: Bool?
}

// MARK: - Google
public struct Google: Codable {
    public let registered: Bool?
    public let accountID, fullName: String?

    enum CodingKeys: String, CodingKey {
        case registered
        case accountID = "account_id"
        case fullName = "full_name"
    }
}

// MARK: - Line
public struct Line: Codable {
    public let registered, name, photo: String?
}

// MARK: - Ok
public struct Ok: Codable {
    public let registered: Bool?
    public let age: String?
}

// MARK: - Skype
public struct Skype: Codable {
    public let registered: Bool?
    public let age: Int?
    public let city: String?
    public let bio: String?
    public let country: String?
    public let gender: Int?
    public let language: String?
    public let name, handle, id: String?
    public let photo: String?
    public let state: String?
}

// MARK: - Telegram
public struct Telegram: Codable {
    public let registered: Bool?
    public let photo: String?
    public let lastSeen: String?
    public let name: String?
    public let about: String?

    enum CodingKeys: String, CodingKey {
        case registered, photo
        case lastSeen = "last_seen"
        case name, about
    }
}

// MARK: - Zalo
public struct Zalo: Codable {
    public let registered: Bool?
    public let dateOfBirth, name, uid: String?

    enum CodingKeys: String, CodingKey {
        case registered
        case dateOfBirth = "date_of_birth"
        case name, uid
    }
}

// MARK: - AppliedRule
public struct AppliedRule: Codable {
    public let id, name, operation: String?
    public let score: Int?
}

// MARK: - Error
public struct Error: Codable {
    public let message : String?
}

// MARK: - Encode/decode helpers


