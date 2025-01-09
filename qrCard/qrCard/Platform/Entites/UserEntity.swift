//
//  UserEntity.swift
//  qrCard
//
//  Created by Vũ Đức on 8/1/25.
//

import Foundation

struct UserEntity: Codable {
    private var id = UUID().uuidString
    var firtName: String
    var lastName: String
    var mobile: Int
    var phone: Int
    var fax: String
    var email: String
    var company: String
    var job: String
    var street: String
    var city: String
    var zip: Int
    var state: String
    var country: String
    var website: String

    init(firtName: String, lastName: String, mobile: Int, phone: Int, fax: String, email: String, company: String, job: String, street: String, city: String, zip: Int, state: String, country: String, website: String) {
        self.firtName = firtName
        self.lastName = lastName
        self.mobile = mobile
        self.phone = phone
        self.fax = fax
        self.email = email
        self.company = company
        self.job = job
        self.street = street
        self.city = city
        self.zip = zip
        self.state = state
        self.country = country
        self.website = website
    }
}


