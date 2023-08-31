//
//  UIImageView+Extension.swift
//  ToDoApp
//
//  Created by Shreeram Bhat on 31/08/23.
//

import UIKit

extension UIImageView {
    
    func downLoadFrom(url: URL) {
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
            }
        }
        task.resume()
    }
    
}

