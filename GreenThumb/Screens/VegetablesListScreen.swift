//
//  ContentView.swift
//  GreenThumb
//
//  Created by Linas on 04/05/2025.
//

import SwiftUI
import SwiftData

struct VegetablesListScreen: View {
  
  @State private var vegetables: [Vegetable] = []
  
  var body: some View {
    VStack {
      List {
        ForEach(vegetables) { vegetable in
          Text(vegetable.name)
        }
      }
      .listStyle(.plain)
    }
    .task {
      do {
        let client = VegetableHTTPClient()
        vegetables = try await client.fetchVegetables()
      } catch {
        fatalError("Error")
      }
    }
  }
}

#Preview {
  VegetablesListScreen()
}
