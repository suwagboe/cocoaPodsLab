
//
//  UsersModel.swift
//  CocoaPodsLab
//
//  Created by Pursuit on 3/5/20.
//  Copyright © 2020 Pursuit. All rights reserved.
//

import Foundation

struct UsersInfo: Decodable{
    let results: [Users]
}

struct Users: Decodable{
    let name: [UserName]
    let location: [LocationInformation]
    let dob: [UsersDateInfo]
}

struct UserName: Decodable{
    let first: String
    let last: String
}

struct LocationInformation: Decodable {
    let street: [StreetInfo]
}

struct StreetInfo: Decodable {
    let number: Int
    let name: String
}

struct UsersDateInfo: Decodable {
    let date: String
    let age: Int
}

/*

 "results": [
     {
         "gender": "male",
         "name": {
             "title": "Mr",
             "first": "Fatih",
             "last": "Durmaz"
         },
         "location": {
             "street": {
                 "number": 350,
                 "name": "Filistin Cd"
             },
             "city": "Elazığ",
             "state": "Bitlis",
             "country": "Turkey",
             "postcode": 17373,
             "coordinates": {
                 "latitude": "79.1822",
                 "longitude": "-43.1795"
             },
             "timezone": {
                 "offset": "+4:30",
                 "description": "Kabul"
             }
         },
         "email": "fatih.durmaz@example.com",
         "login": {
             "uuid": "64a09421-9498-45e4-90d8-33c3cfd589b3",
             "username": "smallleopard268",
             "password": "0000",
             "salt": "JtMIw4p3",
             "md5": "c8d0262be49f17c4dc674330d2fe6929",
             "sha1": "a230b98d246daf52ae89454844ec5936aa2ed951",
             "sha256": "e85db37a708cd139ff8c4cd9e012d389c2d83b802f5f13f245d709d4608530ca"
         },
         "dob": {
             "date": "1956-08-24T20:55:34.834Z",
             "age": 64
         }
 */
