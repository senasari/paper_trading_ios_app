//
//  APIModel.swift
//  project1
//
//  Created by Sena Nur Sari on 3/20/22.
//

import Foundation
import MapKit

var stockItems: [Stock]?

var myStockTable: [Stock]?

struct MStock {
    var price: Double = 0
    var symbol: String = ""
}

struct Stock: Codable {
    let price: Double
    let symbol: String
}




var session = URLSession.shared

func loadItems(from url: URL) async throws -> [Stock] {
    let (data, _) = try await session.data(from: url)
    let decoder = JSONDecoder()
    return try decoder.decode([Stock].self, from: data)
}

func fetchStock(_ stockName: String) async -> [MStock] {
    let urlString: String = "https://financialmodelingprep.com/api/v3/quote-short/" + stockName + "?apikey=62b436859f6605c9d5003d58ebba4b52"
    let url = URL(string: urlString)
    guard let url = url else {
        return []
    }
    do {
        let (data, _) = try await URLSession.shared.data(from: url)
        let stocks = try JSONDecoder().decode([Stock].self, from: data)
        var myStock = MStock(price: stocks[0].price, symbol: stocks[0].symbol)
        return [myStock]
    } catch {
        return []
    }
}
