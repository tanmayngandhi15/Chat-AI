//
//  APIKey.swift
//  Chat AI
//

import Foundation

enum APIKey {
  /// Fetch the API key from `GenerativeAI-Info.plist`
  /// This is just *one* way how you can retrieve the API key for your app.
  static var `ServerResponce`: String {
    guard let filePath = Bundle.main.path(forResource: "ChatAi-Info", ofType: "plist")
    else {
      fatalError("Couldn't find file 'GenerativeAI-Info.plist'.")
    }
    let plist = NSDictionary(contentsOfFile: filePath)
    guard let value = plist?.object(forKey: "Api_Key") as? String else {
      fatalError("Couldn't find key 'API_KEY' in 'GenerativeAI-Info.plist'.")
    }
    if value.starts(with: "_") || value.isEmpty {
      fatalError(
        "Follow the instructions at https://ai.google.dev/tutorials/setup to get an API key."
      )
    }
    return value
  }
}
