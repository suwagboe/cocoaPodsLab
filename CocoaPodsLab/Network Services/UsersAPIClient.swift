//
//  UsersAPIClient.swift
//  CocoaPodsLab
//
//  Created by Pursuit on 3/5/20.
//  Copyright © 2020 Pursuit. All rights reserved.
//

import Foundation
import Alamofire

struct UserAPIClient{
    
    // dont I want an array of users [Users]
    static func getUsers(completion: @escaping (AFResult<Users>)-> () ) {
        var users = [Users]()
        let endpointURL = "https://randomuser.me/api/"
        
        guard let url = URL(string: endpointURL) else {
            return
        }
                
        AF.request(url).response { (response) in
            
            if let error = response.error {
                completion(.failure(error))
            } else if let data = response.data{
                // from url session there can be an error so you do a do catch
                do{
                    let result = try JSONDecoder().decode(UsersInfo.self, from: data)
                    if let users = result.results.first {
                        completion(.success(users))
                    }
                }catch{
                    
                }
            }
        }
        //return [Users]
    }
    
}

/*

 do{
     let results = try JSONDecoder().decode(DrinksWrapper.self, from: data)
     if let cocktail = results.drinks.first{
         completion(.success(cocktail))
     }
 } catch {
     print("\(error)")
  //   completion(.failure(error))
 }
 
 static func getJokes() -> [Joke] {
     
     let endpointURLString = "https://official-joke-api.appspot.com/jokes/programming/ten"
     var jokes = [Joke]()
     NetworkHelper.shared.performDataTask(with: endpointURLString) { (result) in
         
         switch result {
         case .failure(let appError):
             print("appError: \(appError)")
            // break
         case.success(let data):
             do {
                 jokes = try JSONDecoder().decode([Joke].self, from: data)
                 print("there are \(jokes.count) jokes")
                 //let jokes = try JSONDecoder().decode([Joke].self, from: data)
             }catch{
                 print("decoding error: \(error)")
             }
         }
     }
     return jokes
 }
 */
