//
//  VegetableHTTPClient.swift
//  GreenThumb
//
//  Created by Linas on 04/05/2025.
//

import SwiftUI

struct VegetableHTTPClient {
  
  func fetchVegetables() async throws -> [Vegetable] {
    let (data, _) = try await URLSession.shared.data(from: URL(string: "https://azamsharp.com/vegetables.json")!)
    return try JSONDecoder().decode([Vegetable].self, from: data)
  }
}


