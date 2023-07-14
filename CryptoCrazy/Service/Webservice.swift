//
//  Webservice.swift
//  CryptoCrazy
//
//  Created by Salih Yusuf Göktaş on 14.07.2023.
//

import Foundation

class Webservice {
	
	func downloadCurrencies(url: URL, completion: @escaping ([CryptoCurrency]?) -> ()) {
		
		URLSession.shared.dataTask(with: url) { (data, response, error) in
			if let error = error {
				print(error.localizedDescription)
				completion(nil)
			} else if let data = data {
				
				let cryptolist = try? JSONDecoder() .decode([CryptoCurrency].self, from: data)
				
				completion(cryptolist)
				
			}
		}.resume()
	}
}
