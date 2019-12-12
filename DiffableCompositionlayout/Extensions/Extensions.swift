//
//  Extensions.swift
//  DiffableCompositionlayout
//
//  Created by Sachin Dumal on 12/12/19.
//  Copyright © 2019 Sachin Dumal. All rights reserved.
//

import UIKit

let cachedImages = NSCache<NSString, UIImage>()

extension UIImageView {
    
    //Fetch image profile from a URL Using URLSession and DispatchQueue main async
    func loadImageUsingCacheWithUrlString(urlString: String)  {
        self.image = nil
        
        // Check cache for image first
        if let cacheImage = cachedImages.object(forKey: urlString as NSString) {
            self.image = cacheImage
            return
        }
        
        //Otherwise fire off a new download
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print(error ?? "")
            }
            
            DispatchQueue.main.async {
                if let downloadedImage = UIImage(data: data!){
                    cachedImages.setObject(downloadedImage, forKey: urlString as NSString)
                    self.image = downloadedImage
                }
            }
        }.resume()
        
    }
}


