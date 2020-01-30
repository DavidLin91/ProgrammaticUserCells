//
//  ImageClient.swift
//  ProgrammaticUserCells
//
//  Created by David Lin on 1/30/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import UIKit

struct ImageClient {
    static func getImage (urlString: String, completion: @escaping (Result<UIImage?, Error>) -> ()) {
        guard let url = URL(string: urlString) else {
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("\(error)")
            }
            if let data = data {
                let image = UIImage(data: data)
                completion(.success(image))
            }
        }
        dataTask.resume()
    }
}
