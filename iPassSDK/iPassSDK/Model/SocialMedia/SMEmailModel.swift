// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let sMEmailModel = try? JSONDecoder().decode(SMEmailModel.self, from: jsonData)

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let getPassModel = try? JSONDecoder().decode(GetPassModel.self, from: jsonData)

import Foundation

// MARK: - GetPassModel
public struct GetSocialPassModel: Codable {
    public let status: Bool?
    public let message: String?
    public let data: GetSocialPassModelData?
    public let error: GetSocialError?
    
}

// MARK: - GetPassModelData
public struct GetSocialPassModelData: Codable {
    public let resParse: GetSocialResParse?
}

// MARK: - ResParse
public struct GetSocialResParse: Codable {
    public let success: Bool?
    public let error: GetSocialError?
    public let data: GetSocialResParseData?
}

// MARK: - ResParseData
public struct GetSocialResParseData: Codable {
    public let email: String?
    public let score: Int?
    public let deliverable: Bool?
    public let domainDetails: GetSocialDomainDetails?
    public let accountDetails: GetSocialAccountDetails? //issue
    public let breachDetails: GetSocialBreachDetails?
    public let appliedRules: [GetSocialAppliedRule]?
    
    enum CodingKeys: String, CodingKey {
        case email, score, deliverable
        
        case domainDetails = "domain_details"
        case accountDetails = "account_details"
        case breachDetails = "breach_details"
        case appliedRules = "applied_rules"
    }
}

// MARK: - AccountDetails
public struct GetSocialAccountDetails: Codable {
    public let apple, ebay: GetSocialAdobe?
    public let amazon, qzone, adobe, mailru: GetSocialAdobe?
    public let wordpress, imgur, disneyplus, netflix: GetSocialAdobe?
    public let jdid, flipkart, bukalapak, archiveorg: GetSocialAdobe?
    public let lazada, zoho, samsung, evernote: GetSocialAdobe?
    public let envato, patreon, tokopedia, rambler: GetSocialAdobe?
    public let quora, atlassian: GetSocialAdobe?
    public let kakao, booking: GetSocialAdobe?
    public let weibo, yahoo, discord: GetSocialAdobe?
    public let spotify, tumblr, twitter, vimeo: GetSocialAdobe?
    public let microsoft, myspace, pinterest: GetSocialAdobe?
    public let github: GetSocialAdobe?
    public let instagram, lastfm: GetSocialAdobe?
    
    public let facebook: GetSocialFacebook?
    public let flickr: GetSocialFlickr?
    
    
    public let foursquare: GetSocialFoursquare?
    public let google: GetSocialGoogle?
    public let gravatar: GetSocialGravatar?
    public let linkedin: GetSocialLinkedin?
    public let skype: GetSocialSkype?
    public let ok: GetSocialOk?
    public let airbnb: GetSocialAirbnb?
}

// MARK: - Adobe
public struct GetSocialAdobe: Codable {
    public let registered: Bool?
}

// MARK: - Airbnb
public struct GetSocialAirbnb: Codable {
    public let registered: Bool?
    public let about, createdAt, firstName: String?
    public let identityVerified, location, image, revieweeCount: String?
    public let trips, work: String?
    
    enum CodingKeys: String, CodingKey {
        case registered, about
        case createdAt = "created_at"
        case firstName = "first_name"
        case identityVerified = "identity_verified"
        case location, image
        case revieweeCount = "reviewee_count"
        case trips, work
    }
}

// MARK: - Facebook
public struct GetSocialFacebook: Codable {
    public let registered: Bool?
    public let url, name, photo: String?
}

// MARK: - Flickr
public struct GetSocialFlickr: Codable {
    public let registered: Bool?
    public let username: String?
}

// MARK: - Foursquare
public struct GetSocialFoursquare: Codable {
    public let registered: Bool?
    public let bio: String?
    public let photo: String?
    public let profileURL: String?
    
    enum CodingKeys: String, CodingKey {
        case registered, bio, photo
        case profileURL = "profile_url"
    }
}

// MARK: - Google
public struct GetSocialGoogle: Codable {
    public let registered: Bool?
    public let photo: String?
}

// MARK: - Gravatar
public struct GetSocialGravatar: Codable {
    public let registered: Bool?
    public let location, name: String?
    public let profileURL: String?
    public let username: String?
    
    enum CodingKeys: String, CodingKey {
        case registered, location, name
        case profileURL = "profile_url"
        case username
    }
}

// MARK: - Linkedin
public struct GetSocialLinkedin: Codable {
    public let registered, url, name, company: String?
    public let title, location, website, twitter: String?
    public let photo, connectionCount: String?
    
    enum CodingKeys: String, CodingKey {
        case registered, url, name, company, title, location, website, twitter, photo
        case connectionCount = "connection_count"
    }
}

// MARK: - Ok
public struct GetSocialOk: Codable {
    public let registered: Bool?
    public let city: String?
    public let age, dateJoined: Int?
    
    enum CodingKeys: String, CodingKey {
        case registered, city, age
        case dateJoined = "date_joined"
    }
}

// MARK: - Skype
public struct GetSocialSkype: Codable {
    public let registered: Bool?
    public let country, city: String?
    public let gender: Int?
    public let name, id, handle: String?
    public let bio: String?
    public let age: Int?
    public let language, state: String?
    public let photo: String?
}

// MARK: - AppliedRule
public struct GetSocialAppliedRule: Codable {
    public let id, name, operation: String?
    public let score: Int?
}

// MARK: - BreachDetails
public struct GetSocialBreachDetails: Codable {
    public let haveibeenpwnedListed: Bool?
    public let numberOfBreaches: Int?
    public let firstBreach: String?
    public let breaches: [GetSocialBreach]?
    
    enum CodingKeys: String, CodingKey {
        case haveibeenpwnedListed = "haveibeenpwned_listed"
        case numberOfBreaches = "number_of_breaches"
        case firstBreach = "first_breach"
        case breaches
    }
}

// MARK: - Breach
public struct GetSocialBreach: Codable {
    public let name, domain, date: String?
}

// MARK: - DomainDetails
public struct GetSocialDomainDetails: Codable {
    public let domain, tld: String?
    public let registered: Bool?
    public let created, updated, expires, registrarName: String?
    public let registeredTo: String?
    public let disposable, free, custom, dmarcEnforced: Bool?
    public let spfStrict, validMX, acceptAll, suspiciousTLD: Bool?
    public let websiteExists: Bool?
    
    enum CodingKeys: String, CodingKey {
        case domain, tld, registered, created, updated, expires
        case registrarName = "registrar_name"
        case registeredTo = "registered_to"
        case disposable, free, custom
        case dmarcEnforced = "dmarc_enforced"
        case spfStrict = "spf_strict"
        case validMX = "valid_mx"
        case acceptAll = "accept_all"
        case suspiciousTLD = "suspicious_tld"
        case websiteExists = "website_exists"
    }
}

// MARK: - Error
public struct GetSocialError: Codable {
    public let user: UserStatusParse?
    public let message: String?
}

// MARK: - Encode/decode helpers

//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}
